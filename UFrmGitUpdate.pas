unit UFrmGitUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, json, Vcl.StdCtrls, System.IOUtils,
  REST.json,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, REST.Types, REST.Client,
  System.ImageList, Vcl.ImgList, GetVer, FormatFileSizeMod, System.StrUtils,
  Data.Bind.Components, Data.Bind.ObjectScope, ShellApi, SynEdit,
  ExplorerShowFiles, JvBaseDlg, JvSelectDirectory, FileNameInc,
  UThreadDownloadFromGit, Vcl.WinXCtrls;

type
  TFrmGitUpdate = class(TForm)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    ImageList: TImageList;
    SynEdit: TSynEdit;
    LVFiles: TListView;
    BtnDownLoad: TButton;
    BtnClose: TButton;
    BtnCheckUpdate: TButton;
    LblCurrentVer: TLabel;
    LblReposLastVer: TLabel;
    JvSelectDirectory: TJvSelectDirectory;
    LblEditDownloadDir: TLabeledEdit;
    BtnSetDownloadDir: TButton;
    ChBoxDownloadOpenDir: TCheckBox;
    lblPublishedAT: TLabel;
    ProgressBar: TProgressBar;
    LblProgress: TLabel;
    procedure CheckReleases;
    procedure BtnCheckUpdateClick(Sender: TObject);
    function AddLVFilesItems: integer;
    procedure BtnDownloadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnSetDownloadDirClick(Sender: TObject);
  private
    FFileList: TStrings;
    FContentType:  TStrings;
  public
    function XSDateTimeToDateTime(XSDateTime: string): TDateTime;
    function XSDateTimeToDateTimeStr(XSDateTime: string): string;
    procedure ShowModalInit;
  end;

var
  FrmGitUpdate: TFrmGitUpdate;
  arRestFiles: array of TRestFilesRec;
  arThrDownload: array of ThreadReleasDownload;
  arThrHandlers: Array of THandle;

Const
  CAPTION_MB = 'Проверка обновления';
  URL_GITHUB_RELEASES =
    'http://api.github.com/repos/superbot-coder/ShoppingBaseSQLite/releases';
  lv_size = 0;
  lv_url = 1;

  msg_timer_check_update = 'Идет проверка обновления';
  msg_timer_download_file = 'Идет загрузка файла';

implementation

USES UFrmMain;

{$R *.dfm}

procedure TFrmGitUpdate.BtnDownloadClick(Sender: TObject);
var
  msg         : String;
  DownloadDir : string;
  FileName    : string;
  i,x, pos    : SmallInt;
  ShowFiles   : TStrings;
  FilesCount  : SmallInt;
  WatchTime   : Cardinal;
begin

  if LVFiles.Items.Count = 0 then
  begin
    MessageBox(Handle, PChar('Нет файлов для скачивания.'), PChar(CAPTION_MB),
      MB_ICONWARNING);
    Exit;
  end;

  BtnDownLoad.Enabled := false;
  DownloadDir := IncludeTrailingBackslash(LblEditDownloadDir.Text);

  ShowFiles := TStringList.Create;
  try
    for i := 0 to LVFiles.Items.Count -1 do
    begin
      if Not LVFiles.Items[i].Checked then Continue;
      x := Length(arRestFiles);
      SetLength(arRestFiles, x + 1);
      arRestFiles[x].FileLinkURL := FFileList.Strings[i];
      arRestFiles[x].ContentType := FContentType.Strings[i];
      arRestFiles[x].FileName    := LVFiles.Items[i].Caption;

      // заполениние массивов потоков
      SetLength(arThrDownload, x + 1);
      SetLength(arThrHandlers, x + 1);
      arThrDownload[x] := ThreadReleasDownload.Create(DownloadDir, PRestFilesRec(@arRestFiles[i]), false);
      arThrHandlers[x] := arThrDownload[x].Handle;
    end;

    FilesCount := Length(arRestFiles);

    //FilesCount := Length(arRestFiles);
    //SetLength(arThrDownload, FilesCount);
    //setLength(arThrHandlers, FilesCount);

    //for i := 0 to FilesCount -1 do
    //begin
      //arThrDownload[i] := ThreadReleasDownload.Create(DownloadDir, PRestFilesRec(@arRestFiles[i]), false);
      //arThrHandlers[i] := arThrDownload[i].Handle;
    //end;

    pos := 0;
    ProgressBar.Position := 0;
    LblProgress.Caption  := msg_timer_download_file;
    LblProgress.Visible  := true;

    //ProgressBar.Visible  := true;
    WatchTime := GetTickCount;
    while WaitForMultipleObjects(FilesCount, Pointer(arThrHandlers), true, 200) = WAIT_TIMEOUT do
    begin
      Application.ProcessMessages;
      if Length(LblProgress.Caption) > Length(msg_timer_download_file) + 10 then
        LblProgress.Caption := msg_timer_download_file
      else
        LblProgress.Caption  := LblProgress.Caption + '.';
      inc(pos);
      ProgressBar.Position := pos;
      if pos >= 100 then pos := 75;
      // Если время ожидания превысит более 5 мин.
      if (GetTickCount - WatchTime) > 300000 then Break;
    end;

    ProgressBar.Position := 100;
    FrmMain.mm.Lines.Add('step: 3');
    //ProgressBar.Visible  := false;
    for i := 0 to FilesCount -1 do
    begin
      if (arRestFiles[i].RESTStatCode = 200) and (arRestFiles[i].FileSave <> '') then
        if FileExists(arRestFiles[i].FileSave) then
        begin
          ShowFiles.Add(ExtractFileName(arRestFiles[i].FileSave));
          msg := msg + 'Файл "' + LVFiles.Items[i].Caption + '" был успешно скачаен.' + #13;
        end
        else
          msg := msg + 'Файл "' + LVFiles.Items[i].Caption + '" не удалось скачать.' + #13;
    end;

    if msg <> '' then
      MessageBox(Handle, PChar(msg), PChar(CAPTION_MB), MB_ICONINFORMATION)
    else
      MessageBox(Handle, PChar('Операция выполнена'), PChar(MB_CAPTION), MB_ICONINFORMATION);

    ProgressBar.Position := 0;
    LblProgress.Visible  := false;

    if (ChBoxDownloadOpenDir.Checked) and (ShowFiles.Count <> 0) then
      ShowFilesOnExplorer(DownloadDir, ShowFiles);

  finally
    BtnDownLoad.Enabled := true;
    ShowFiles.Free;
    for i := 0 to FilesCount -1 do  arThrDownload[i].Free;
    arThrHandlers := Nil;
    arThrDownload := Nil;
  end;

end;

procedure TFrmGitUpdate.BtnSetDownloadDirClick(Sender: TObject);
begin
  JvSelectDirectory.InitialDir := USERPROFILE + '\Downloads\';
  if JvSelectDirectory.Execute then
    LblEditDownloadDir.Text := JvSelectDirectory.Directory + '\';
end;

function TFrmGitUpdate.AddLVFilesItems: integer;
begin
  with LVFiles.Items.Add do
  begin
    Caption := '';
    ImageIndex := -1;
    SubItems.Add('');
    SubItems.Add('');
    Checked := true;
    Result := index;
  end;
end;

procedure TFrmGitUpdate.CheckReleases;
var
  LastRelease: TJSONObject;
  tag_name: string;
  StrValue: string;
  FileName: string;
  published_at: string;
  assetsArray: TJSONArray;
  i, x : Word;
begin

  SynEdit.Clear;
  LVFiles.Clear;
  FFileList.Clear;
  FContentType.Clear;

  RESTClient.BaseURL := URL_GITHUB_RELEASES;
  RESTClient.Accept  := 'application/json';
  RESTResponse.RootElement := '[0]';
  try
    RESTRequest.Execute;
  Except
    // Exception code...
    SynEdit.Text := 'Не удалось подключиться или получить данные с GitHub.';
    Exit;
  end;

  // Проверка, что нужный ресурс найден
  if RESTResponse.StatusCode <> 200 then
  begin
    SynEdit.Clear;
    SynEdit.Lines.Add('Status: ' + RESTResponse.StatusText);
    Exit;
  end;

  SynEdit.Clear;
  // mmInfo.Lines.Add('Status: ' + RESTResponse.StatusText);

  if RESTResponse.JSONValue = Nil then
  begin
    // SynEdit.Lines.Add('JSONValue = Nil');
    Exit;
  end;

  LastRelease := RESTResponse.JSONValue as TJSONObject;
  if LastRelease.FindValue('tag_name') = Nil then
  begin
    SynEdit.Lines.Add('Не найден параметр: tag_name');
    Exit;
  end;

  tag_name := LastRelease.GetValue('tag_name').Value;

  LblReposLastVer.Caption := 'Последняя версия в репозитории: ' + tag_name;

  // CurrentVer := '1.0.0.0';
  // ***************** Проверка версии **************

  if CurrentVer = tag_name then
  begin
    SynEdit.Lines.Add('Ваша версия программы: ' + CurrentVer +
      ' является самой актуальной');
    Exit;
  end;

  published_at := XSDateTimeToDateTimeStr(LastRelease.GetValue('published_at').Value);
  lblPublishedAT.Caption := 'Опубликовано: ' + published_at;

  // SynEdit.Lines.Add('Было обнаружена новая версия программы: ' + tag_name);
  if LastRelease.FindValue('body') <> Nil then
  begin
    // SynEdit.Lines.Add('Описание:');
    SynEdit.Lines.Text := LastRelease.GetValue('body').Value;
    SynEdit.Perform(WM_VScroll, SB_TOP, 0);
  end;

  if LastRelease.FindValue('assets') = Nil then
  begin
    SynEdit.Lines.Add('Not found the parametr: "assets"');
    SynEdit.Lines.Add('The End!');
    Exit;
  end;

  arRestFiles := Nil;

  assetsArray := LastRelease.GetValue('assets') as TJSONArray;
  for i := 0 to assetsArray.Count - 1 do
  begin
    x := AddLVFilesItems;
    LVFiles.Items[x].Caption := assetsArray.Items[i].FindValue('name').Value;
    StrValue := assetsArray.Items[i].FindValue('size').Value;
    LVFiles.Items[x].SubItems[lv_size] := FormatFileSize(StrToInt64(StrValue));
    LVFiles.Items[x].ImageIndex := 0;

    FFileList.Add(assetsArray.Items[i].FindValue('browser_download_url').Value);
    FContentType.Add(assetsArray.Items[i].FindValue('content_type').Value);
  end;

  if LastRelease.FindValue('zipball_url') <> nil then
  begin
    x := AddLVFilesItems;
    LVFiles.Items[x].Caption := 'Source code.zip';
    LVFiles.Items[x].SubItems[lv_size] := '';
    LVFiles.Items[x].ImageIndex := 1;
    FFileList.Add(LastRelease.GetValue('zipball_url').Value);
    FContentType.Add('application');
  end;

 (*
  if LastRelease.FindValue('tarball_url') <> nil then
  begin
    x := AddLVFilesItems;
    LVFiles.Items[x].Caption := 'Source code.tar.gz';
    LVFiles.Items[x].SubItems[lv_size] := '';
    LVFiles.Items[x].ImageIndex := 1;
    FFileList.Add(LastRelease.GetValue('tarball_url').Value);
    FContentType.Add('application');
  end;  *)

  if LVFiles.Items.Count <> 0 then
    BtnDownLoad.Enabled := true;
end;

procedure TFrmGitUpdate.FormActivate(Sender: TObject);
begin
  SynEdit.Color := SystemColorWindow;
  LVFiles.Color := SystemColorWindow;
end;

procedure TFrmGitUpdate.FormCreate(Sender: TObject);
begin
  LblCurrentVer.Caption   := 'Текущая версия программы: ' + CurrentVer;
  LblEditDownloadDir.Text := USERPROFILE + '\Downloads\';
  FFileList := TStringList.Create;
  FContentType  := TStringList.Create;
end;

procedure TFrmGitUpdate.FormDestroy(Sender: TObject);
begin
  FFileList.Free;
  FContentType.Free;
end;

procedure TFrmGitUpdate.ShowModalInit;
begin
  SynEdit.Clear;
  LVFiles.Clear;
  FFileList.Clear;
  // BtnDownLoad.Enabled := false;
  CheckReleases;
  ShowModal;
end;

function TFrmGitUpdate.XSDateTimeToDateTime(XSDateTime: string): TDateTime;
var
  fs: TFormatSettings;
begin
  fs.ShortDateFormat := 'YYYY-MM-DD';
  fs.ShortTimeFormat := 'HH:MM:SS';
  fs.DateSeparator   := '-';
  fs.TimeSeparator   := ':';
  // Глобальное нелокализованое время; global non-localized time
  Result := StrToDateTime(XSDateTime, fs);
end;

function TFrmGitUpdate.XSDateTimeToDateTimeStr(XSDateTime: string): string;
begin
  Result := DateTimeToStr(XSDateTimeToDateTime(XSDateTime));
end;

procedure TFrmGitUpdate.BtnCheckUpdateClick(Sender: TObject);
begin
  CheckReleases;
end;

procedure TFrmGitUpdate.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

end.

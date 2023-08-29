unit UFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.NumberBox, Vcl.Themes,
  Vcl.ControlList, Vcl.ExtCtrls, Vcl.DBCtrls, acDBGrid, Vcl.Mask, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, JvExDBGrids, JvDBGrid, JSON, REST.Json, System.IOUtils,
  Vcl.Grids, Vcl.DBGrids, JvExMask, JvToolEdit, JvMaskEdit, JvCheckedMaskEdit,
  JvDatePickerEdit, JvDBDatePickerEdit, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, JvCombobox, System.DateUtils, System.StrUtils, Vcl.Menus,
  Winapi.ShellAPI, Vcl.CheckLst, JvExCheckLst, JvCheckListBox, JvExForms,
  JvCustomItemViewer, JvImagesViewer, skia.Vcl, GetVer, ShlObj, ExplorerShowFiles,
  JvComponentBase, JvDragDrop, System.Generics.Collections, System.Generics.Defaults, DBTypes;

type
  TFrmMain = class(TForm)
    OpenDialog: TOpenDialog;
    StatusBar: TStatusBar;
    PanelSearch: TPanel;
    lblEdSearch: TLabeledEdit;
    BtnSearch: TButton;
    BtnSearchClose: TButton;
    FDConnection: TFDConnection;
    FDQ: TFDQuery;
    FDQBuy: TFDQuery;
    DSBuy: TDataSource;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PanelEditBuy: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblSellerPhone: TLabel;
    LblSellerName: TLabel;
    lblProductId: TLabel;
    dbeProductName: TDBEdit;
    dbeCount: TDBEdit;
    dbeBuyPrice: TDBEdit;
    DBCmBoxSelectShop: TDBComboBox;
    DBNavigatorBuyTab: TDBNavigator;
    dbeSellerPhone: TDBEdit;
    dbeSellerName: TDBEdit;
    dbeProductId: TDBEdit;
    jvdpeGuaranteeLastDate: TJvDBDatePickerEdit;
    JvdpeDateBuy: TJvDBDatePickerEdit;
    JvDBGBuy: TJvDBGrid;
    PnlBarBuy: TPanel;
    TabSheet3: TTabSheet;
    mm: TMemo;
    ChBoxBuyTabEditMode: TCheckBox;
    ImageList16: TImageList;
    JvDBGSell: TJvDBGrid;
    DSSell: TDataSource;
    FDQSell: TFDQuery;
    PnlBarSell: TPanel;
    ChBoxSellTabEditMode: TCheckBox;
    PanelEditSell: TPanel;
    JvDBDatePickerEdit1: TJvDBDatePickerEdit;
    dbeSellProductName: TDBEdit;
    dbeSellCount: TDBEdit;
    dbeSellPrice: TDBEdit;
    dbeBuyerPhone: TDBEdit;
    dbeBuyerName: TDBEdit;
    LblSellDate: TLabel;
    lblSellProductName: TLabel;
    lblSellCount: TLabel;
    LblSellPrice: TLabel;
    lblBuyerPhone: TLabel;
    lblBuyerName: TLabel;
    DBNavigatorSellTab: TDBNavigator;
    SpBtnBuyTabColAutoSize: TSpeedButton;
    SpBtnBuyTabColSave: TSpeedButton;
    SpBtnSellTabColSave: TSpeedButton;
    SpBtnSellTabColAutoSize: TSpeedButton;
    JvChCmBoxFieldsSearchBuy: TJvCheckedComboBox;
    lblSelectFieldsSearch: TLabel;
    DBCmBoxGuarantPeriod: TDBComboBox;
    JvChCmBoxSelectGroups: TJvCheckedComboBox;
    LblSelectGroups: TLabel;
    SpBtnEditGroups: TSpeedButton;
    BtnSetGroup: TButton;
    FDTGroups: TFDTable;
    JvChCmBoxViewSelectedGroups: TJvCheckedComboBox;
    LblSelectViewGroups: TLabel;
    lblProductWebPage: TLabel;
    PopMenuDBG: TPopupMenu;
    PM_OpenWebPage: TMenuItem;
    DBMemoWebPage: TDBMemo;
    PM_CloneRecord: TMenuItem;
    JvImagesViewer: TJvImagesViewer;
    ChBoxImagesViewer: TCheckBox;
    CheckBoxAutosize: TCheckBox;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    MM_OpenGitHub: TMenuItem;
    MM_OpenSettings: TMenuItem;
    MM_Test: TMenuItem;
    MM_OpenFrmUpdate: TMenuItem;
    JvDragDrop: TJvDragDrop;
    BtnBuyTabLoadCol: TButton;
    BtnBuyTabDropAllColSettings: TButton;
    DBCmBoxItemState: TDBComboBox;
    LlbStatItem: TLabel;
    JvChCmBoxFieldsSearchSell: TJvCheckedComboBox;
    MM_Exit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnSearchCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpBtnBuyTabColAutoSizeClick(Sender: TObject);
    procedure SpBtnBuyTabColSaveClick(Sender: TObject);
    procedure FDQBeforeDelete(DataSet: TDataSet);
    procedure SpBtnSellTabColSaveClick(Sender: TObject);
    procedure SpBtnSellTabColAutoSizeClick(Sender: TObject);
    procedure ChBoxBuyTabEditModeClick(Sender: TObject);
    procedure ChBoxSellTabEditModeClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure SpBtnEditGroupsClick(Sender: TObject);
    procedure BtnSetGroupClick(Sender: TObject);
    procedure FDQBuyAfterScroll(DataSet: TDataSet);
    procedure DBNavigatorBuyTabClick(Sender: TObject; Button: TNavigateBtn);
    procedure jvdpeGuaranteeLastDateClick(Sender: TObject);
    procedure DBCmBoxGuarantPeriodChange(Sender: TObject);
    procedure PM_OpenWebPageClick(Sender: TObject);
    procedure DBMemoWebPageChange(Sender: TObject);
    procedure PM_CloneRecordClick(Sender: TObject);
    procedure JvDBGBuyCellClick(Column: TColumn);
    procedure ChBoxImagesViewerClick(Sender: TObject);
    procedure CheckBoxAutosizeClick(Sender: TObject);
    procedure PopMenuDBGPopup(Sender: TObject);
    procedure MM_OpenGitHubClick(Sender: TObject);
    procedure JvImagesViewerDblClick(Sender: TObject);
    procedure MM_OpenSettingsClick(Sender: TObject);
    procedure MM_TestClick(Sender: TObject);
    procedure MM_OpenFrmUpdateClick(Sender: TObject);
    procedure JvDragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure JvChCmBoxViewSelectedGroupsChange(Sender: TObject);
    procedure MM_ExitClick(Sender: TObject);
  private
    FSTLog: TStrings;
    FFieldLastSorted: string;
    FSortingDirection: TSortType;
    procedure UpdateStatusBar;
    Procedure AddShops;
    procedure CreateTables(TabName: TTablesName);
    procedure log(StrValue: String);
    function TableExistes(TableName: String): boolean;
    procedure Search;
    procedure SetFieldsDefault(TabName: TTablesName);
    procedure SetFieldsSearch(TabName: TTablesName);
    procedure SetDBEditControls(TabName: TTablesName);
    procedure SetCheckedSelectedGroups(BuyId: Integer);
    procedure SetGuaranteeLastDate;
    procedure SetControlSelectedGroups;
    function GetGroupIDByName(GroupName: String): Integer;
    function GenerateNewImageDir(index: integer): string;
    function GetImageDir(ID: integer): String;
    function NewImageID: Integer;
    procedure MoveImagesToNewDir;
    procedure BuyFieldsListCreate;
    procedure FieldsSearchListCreate;
    function CheckFlag(FPD_FLAGS, Flag: Word): Boolean;
  public
    { Public declarations }
    procedure UpdateMainTable;
  end;

var
  FrmMain: TFrmMain;
  CurrDir       : String;
  FileNameBase  : String;
  ConnectString : String;
  DBFile        : String;
  DBSaveDir     : String;
  DBImagesDir   : String;
  USERPROFILE   : String;
  CurrentVer    : String;
  FileBuyTabColSettings : String;
  FileSellTabColSettings: String;
  SystemColorWindow : TColor;
  BuyFields         : TDictionary<String, TFieldRec>;
  BuyFieldsSearch   : TDictionary<String, String>;
  GroupsSearch      : TDictionary<string, TGroupRec>;

const
  GitHubLink = 'https://github.com/superbot-coder/ShoppingBaseSQLite';
  MB_CAPTION = 'Shopping History';

implementation

USES UfrmEditGroups, UFrmSelectWebPage, UFrmSettings, UFrmImageViewer,
     UFrmGitUpdate;

{$R *.dfm}

procedure TFrmMain.AddShops;
begin
  FDQ.SQL.Text := 'SELECT DISTINCT shop_name FROM BuyTab';
  FDQ.Open;
  FDQ.First;
  DBCmBoxSelectShop.Items.Clear;
  while Not FDQ.Eof do
  begin
    DBCmBoxSelectShop.Items.Add(FDQ.Fields[0].AsString);
    FDQ.Next;
  end;
  FDQ.Close;
  //DSQ.Enabled := true;
  //ShowMessage(IntToStr(ADOQuery.RecordCount) + ' ' + #13 + DBCmBoxShop.Items.Text);
end;

procedure TFrmMain.BtnSearchClick(Sender: TObject);
begin
  Search;
end;

procedure TFrmMain.BtnSearchCloseClick(Sender: TObject);
begin
  UpdateMainTable;
  UpdateStatusBar;
end;

procedure TFrmMain.BtnSetGroupClick(Sender: TObject);
Var
  buy_id, grp_id, i: Integer;
begin
  buy_id := FDQBuy.FieldByName('id').AsInteger;
  // mm.Lines.Add('FDQBuy.FieldByName(''id'').AsInteger ' + IntToStr(buy_id));

  for i := 0 to JvChCmBoxSelectGroups.Items.Count -1 do
  begin
    grp_id := GetGroupIDByName(JvChCmBoxSelectGroups.Items[i]);
    // mm.Lines.Add(JvChCmBoxSelectGroups.Items[i] + ' = ' +IntToStr(grp_id));
    if grp_id = -1 then Continue;

    with FDQ do
    begin
      SQL.Text := 'SELECT * FROM ' + arTabNameStr[tnBuyGroupTable] +
                      ' WHERE (buy_id = :p1) and (group_id = :p2)';
      Params.ParamByName('p1').AsInteger := buy_id;
      Params.ParamByName('p2').AsInteger := grp_id;
      Open;

      if JvChCmBoxSelectGroups.Checked[i] = true then
      begin
        if IsEmpty then
        begin
          SQL.Text := 'INSERT INTO ' + arTabNameStr[tnBuyGroupTable] +
                      ' (buy_id, group_id) VALUES (:p1, :p2)';
          Params[0].AsInteger := buy_id;
          Params[1].AsInteger := grp_id;
          ExecSQL;
        end;
      end
      else
      begin
        if Not IsEmpty then
        begin
          SQL.Text := 'DELETE FROM ' + arTabNameStr[tnBuyGroupTable] +
                      ' WHERE buy_id = :p1 AND group_id = :p2';
          Params[0].AsInteger := buy_id;
          Params[1].AsInteger := grp_id;
          ExecSQL;
        end;
      end;
    end;

  end;

end;

procedure TFrmMain.BuyFieldsListCreate;
var
  FR: TFieldRec;
begin

  // 0 id
  FR.Caption      := 'ID';
  FR.DefWidth     := 50;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE;
  BuyFields.Add('id', FR);

  // 1 date_buy
  FR.Caption      := 'Дата покупки';
  FR.DefWidth     := 100;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE or FPD_FIELD_SEARCHE;
  BuyFields.Add('date_buy', FR);

  // 2 product_name
  FR.Caption      := 'Название товара';
  FR.DefWidth     := 300;
  FR.DefAlignment := taLeftJustify;
  FR.FPD_FLAGS    := FPD_PRESET_ALL;
  BuyFields.Add('product_name', FR);

  // 3 count
  FR.Caption      := 'Количество';
  FR.DefWidth     := 50;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE or FPD_FIELD_SEARCHE;
  BuyFields.Add('count', FR);

  // 4 buy_price
  FR.Caption      := 'Цена';
  FR.DefWidth     := 100;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE
                     or FPD_FIELD_SEARCHE or FPD_FIELD_CLONE;
  BuyFields.Add('buy_price', FR);

  // 5 guarant_period
  FR.Caption      := 'Срок гарантии';
  FR.DefWidth     := 50;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE
                     or FPD_FIELD_SEARCHE or FPD_FIELD_CLONE;
  BuyFields.Add('guarant_period', FR);

  // 6 guarant_last_date
  FR.Caption      := 'Дата истечения гарантии';
  FR.DefWidth     := 100;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE
                     or FPD_FIELD_SEARCHE or FPD_FIELD_CLONE;
  BuyFields.Add('guarant_last_date', FR);

  // 7 shop_name
  FR.Caption      := 'Магазин';
  FR.DefWidth     := 100;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE
                     or FPD_FIELD_SEARCHE or FPD_FIELD_CLONE;
  BuyFields.Add('shop_name', FR);

  // 8 Код товара в магазине
  FR.Caption      := 'Код товара в магазине';
  FR.DefWidth     := 50;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE
                     or FPD_FIELD_SEARCHE or FPD_FIELD_CLONE;
  BuyFields.Add('product_id', FR);

  // 9 Телефон продавца
  FR.Caption      := 'Телефон продавца';
  FR.DefWidth     := 150;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE or FPD_FIELD_SEARCHE;
  BuyFields.Add('seller_phone', FR);

  // 10 Имя продавца
  FR.Caption      := 'Имя продавца';
  FR.DefWidth     := 150;
  FR.DefAlignment := taLeftJustify;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE or FPD_FIELD_SEARCHE;
  BuyFields.Add('seller_name', FR);

  // 11 Веб страница
  FR.Caption      := 'Веб страница';
  FR.DefWidth     := 150;
  FR.DefAlignment := taLeftJustify;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE or FPD_FIELD_SEARCHE;
  BuyFields.Add('web_page', FR);

  // 12  ID картинок
  // Это поле отображается только для тестирования на период разработки
  FR.Caption      := 'ID картинок';
  FR.DefWidth     := 50;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_CLONE;
  BuyFields.Add('image_id', FR);

  // 13 Состояние
  FR.Caption      := 'Состояние';
  FR.DefWidth     := 150;
  FR.DefAlignment := taCenter;
  FR.FPD_FLAGS    := FPD_FIELD_CREATE or FPD_FIELD_VISIBLE or FPD_FIELD_SEARCHE;
  BuyFields.Add('item_state', FR);
end;

procedure TFrmMain.ChBoxBuyTabEditModeClick(Sender: TObject);
begin
  if ChBoxBuyTabEditMode.Checked then
  begin
    DBNavigatorBuyTab.Enabled := true;
    PanelEditBuy.Visible      := true;
    SetDBEditControls(tnBuyTable);
    // UpdateControlSelectedGroups;
  end
    else
  begin
   DBNavigatorBuyTab.Enabled := false;
   PanelEditBuy.Visible      := false;
  end;
end;

procedure TFrmMain.ChBoxImagesViewerClick(Sender: TObject);
begin
  if ChBoxImagesViewer.Checked then
    JvImagesViewer.Visible := true
  else
    JvImagesViewer.Visible := false;
end;

procedure TFrmMain.ChBoxSellTabEditModeClick(Sender: TObject);
begin
  if ChBoxSellTabEditMode.Checked then
  begin
    DBNavigatorSellTab.Enabled := true;
    PanelEditSell.Visible      := true;
  end
    else
  begin
    DBNavigatorSellTab.Enabled := false;
    PanelEditSell.Visible      := false;
  end;
end;

procedure TFrmMain.CheckBoxAutosizeClick(Sender: TObject);
begin
  JvDBGBuy.AutoSizeColumns := CheckBoxAutosize.Checked;
  {
  if CheckBoxAutosize.Checked then
    JvDBGBuy.AutoSizeColumns := true
  else
    JvDBGBuy.AutoSizeColumns := False;
  }
end;

function TFrmMain.CheckFlag(FPD_FLAGS, Flag: Word): Boolean;
begin
   if (FPD_FLAGS AND FLag) = Flag then
     Result := true
   else
     Result := false;
end;

procedure TFrmMain.CreateTables(TabName: TTablesName);
begin
  with FDQ do
  begin
    // Таблица BuyTable
    if TabName in [tnAll, tnBuyTable] then
    begin
      SQL.Text := 'CREATE TABLE ' + arTabNameStr[tnBuyTable] + ' (' +
        arBuyTabFieldsName[0] + ' INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1, ' +
        arBuyTabFieldsName[1] + ' DATE NOT NULL, '     + // Дата покупки
        arBuyTabFieldsName[2] + ' VARCHAR NOT NULL,'   + // Название товара
        arBuyTabFieldsName[3] + ' INTEGER NOT NULL, '  + // Количество
        arBuyTabFieldsName[4] + ' CURRENCY NOT NULL, ' + // Цена
        arBuyTabFieldsName[5] + ' INTEGER, '           + // Срок гарантии
        arBuyTabFieldsName[6] + ' DATE, '              + // Дата истечения гарантии
        arBuyTabFieldsName[7] + ' VARCHAR, '           + // Название магазина
        arBuyTabFieldsName[8] + ' VARCHAR, '           + // Код товара в магазине
        arBuyTabFieldsName[9] + ' VARCHAR, '           + // Телефон продавца
        arBuyTabFieldsName[10] + ' VARCHAR, '          + // Имя продавца
        arBuyTabFieldsName[11] + ' VARCHAR, '          + // Веб страница
        arBuyTabFieldsName[12] + ' INTEGER, '          + // id директории картинок
        arBuyTabFieldsName[13] + ' VARCHAR)';            // Состояние вещи
      ExecSQL;
      log('Create Table Name: ' + arTabNameStr[tnBuyTable]);
    end;

    // Таблица SellTable
    if TabName in [tnAll, tnSellTable] then
    begin
      SQL.Text := 'CREATE TABLE ' + arTabNameStr[tnSellTable] + ' (' +
        arSellTabFieldsName[0] + ' INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
        arSellTabFieldsName[1] + ' DATA, '              + // Дата продажи
        arSellTabFieldsName[2] + ' VARCHAR,'            + // Название товара
        arSellTabFieldsName[3] + ' INTEGER, '           + // Количество
        arSellTabFieldsName[4] + ' CURRENCY NOT NULL, ' + // Цена продажи
        arSellTabFieldsName[5] + ' VARCHAR, '           + // Телефон покупателя
        arSellTabFieldsName[6] + ' VARCHAR)';             // Имя покупателя
      ExecSQL;
      log('Create Table Name: ' + arTabNameStr[tnSellTable]);
    end;

    // Таблица GroupsTable
    if TabName in [tnAll, tnGroupsTable] then
    begin
      SQL.Text := 'CREATE TABLE ' + arTabNameStr[tnGroupsTable] + ' (' +
                  'id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
                  'group_name VARCHAR UNIQUE NOT NULL)'; // Имя группы товара

      ExecSQL;
      log('Create Table Name: ' + arTabNameStr[tnGroupsTable]);
    end;

    //Таблица BuySellTable
    if TabName in [tnAll, tnBuySellTable] then
    begin
      SQL.Text := 'CREATE TABLE ' + arTabNameStr[tnBuySellTable] + ' (' +
                  'id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
                  'buy_id INTEGER NOT NULL, ' + // id записи товара из BuyTab
                  'sell_id INTEGER NOT NULL)';  // id записи товара из SellTab
      ExecSQL;
      log('Create Table Name: ' + arTabNameStr[tnBuySellTable]);
    end;

    //Таблица BuyGroupTab
    if TabName in [tnAll, tnBuyGroupTable] then
    begin
      SQL.Text := 'CREATE TABLE ' + arTabNameStr[tnBuyGroupTable] + ' (' +
                  'id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
                  'buy_id INTEGER NOT NULL, ' + // id записи товара из BuyTab
                  'group_id INTEGER NOT NULL)'; // id группы товара из GroupsTab
      ExecSQL;
      log('Create Table Name: ' + arTabNameStr[tnBuyGroupTable]);
    end;

    //Таблица ImagesTab
    if TabName in [tnAll, tnImagesTable] then
    begin
      SQL.Text := 'CREATE TABLE ' + arTabNameStr[tnImagesTable] + ' (' +
                  'id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
                  'directory)';  // images dirctoty
      ExecSQL;
      log('Create Table Name: ' + arTabNameStr[tnImagesTable]);
    end;

  end;
end;

procedure TFrmMain.DBCmBoxGuarantPeriodChange(Sender: TObject);
begin
  SetGuaranteeLastDate;
end;

procedure TFrmMain.DBMemoWebPageChange(Sender: TObject);
var
  s: string;
  i: SmallInt;
begin
  if (Sender as TDBMemo).Lines.Count = 0 then Exit;
  for i := 0 to (Sender as TDBMemo).Lines.Count -1 do
  begin
   s := (Sender as TDBMemo).Lines[i];
   if RightStr(s, 1) = '/' then Delete(s, Length(s), 1);
   if LowerCase(LeftStr(s, 8)) = 'https://' then
   begin
     Delete(s, 1, 8);
     (Sender as TDBMemo).Lines[i] := s;
   end;
   if LowerCase(LeftStr(s, 7)) = 'http://' then
   begin
     Delete(s, 1, 7);
     (Sender as TDBMemo).Lines[i] := s;
   end;
  end;
end;

procedure TFrmMain.DBNavigatorBuyTabClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if TNavigateBtn.nbInsert = nbInsert then
    JvImagesViewer.Directory := '';
end;

procedure TFrmMain.FDQBeforeDelete(DataSet: TDataSet);
begin
  if MessageBox(Handle,
    PChar('Вы действительно желаете удалить запись?'),
     PChar(''), MB_ICONWARNING or MB_YESNO) = ID_NO then Abort;

  // Удаление связи с группами ключа удаляемой записи
  FDQ.SQL.Text := 'DELETE FROM ' + arTabNameStr[tnBuyGroupTable] + ' ' +
                  'WHERE buy_id = ' + DataSet.FieldByName('id').AsString;
  FDQ.ExecSQL;
end;

procedure TFrmMain.FDQBuyAfterScroll(DataSet: TDataSet);
begin
  if PanelEditBuy.Visible then
    SetCheckedSelectedGroups(FDQBuy.FieldByName('id').AsInteger);
end;

procedure TFrmMain.FieldsSearchListCreate;
begin
  // Create list for Buy
  {
  for var ItemPair in BuyFields do
    if CheckFlag(ItemPair.Value.FPD_FLAGS, FPD_FIELD_SEARCHE) then
      BuyFieldsSearchList.Add(ItemPair.Value.Caption, ItemPair.Key);
  }
end;

procedure TFrmMain.FormActivate(Sender: TObject);
var
  i: SmallInt;
begin
  FDConnection.Open;
  mm.Lines.Add(' TFrmMain.FormActivate');
  if FDConnection.Connected then
  begin
    for i := 0 to Length(arTabNameStr) -1 do
    begin
      if i = 0 then Continue;
      if TableExistes(arTabNameStr[TTablesName(i)]) = false then
        CreateTables(TTablesName(i));
    end;

    //FDTGroups.TableName := arTabNameStr[tnGroupsTable];
    //if Not FDTGroups.Active then FDTGroups.Open;

    UpdateMainTable;
    SetControlSelectedGroups;
    SetFieldsDefault(tnAll);
    SetFieldsSearch(tnBuyTable);

    if FileExists(FileBuyTabColSettings) then
      JvDBGBuy.Columns.LoadFromFile(FileBuyTabColSettings);
    if FileExists(FileSellTabColSettings)  then
      JvDBGSell.Columns.LoadFromFile(FileSellTabColSettings);

    UpdateStatusBar;
  end;

end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  CurrentVer  := GetVertionInfo(Application.ExeName, true);
  CurrDir     := ExtractFileDir(Application.ExeName);
  USERPROFILE := GetEnvironmentVariable('USERPROFILE');

  //CmBoxVclStyle.ItemIndex := CmBoxVclStyle.Items.IndexOf('Sapphire Kamri');
  //if CmBoxVclStyle.Text <> '' then TStyleManager.SetStyle(CmBoxVclStyle.Text);

  FSTLog := TStringList.Create;

  DBSaveDir   := USERPROFILE + '\Documents\ShoppingBaseSave';
  DBImagesDir := DBSaveDir + '\Images';
  DBFile      := DBSaveDir + '\ShoppingBase.db3';
  FileBuyTabColSettings  := DBSaveDir + '\BuyTabColumnsSettings.data';
  FileSellTabColSettings := DBSaveDir + '\SellTabColumnsSettings.data';

  if Not DirectoryExists(DBSaveDir) then ForceDirectories(DBSaveDir);

  FDConnection.Params.Database := DBFile;
  SystemColorWindow            := StyleServices.GetSystemColor(clWindow);
  JvImagesViewer.Color         := SystemColorWindow;
  //JvDBG.Align := alTop;

  PanelEditBuy.Align := alTop;
  PanelSearch.Align  := alTop;
  BuyFields := TDictionary<String, TFieldRec>.Create;
  BuyFieldsSearch := TDictionary<String, String>.Create;
  GroupsSearch := TDictionary<String, TGroupRec>.Create;
  BuyFieldsListCreate;
  FieldsSearchListCreate;

  //BtnSearchCloseClick(Nil);

end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FSTLog.Free;
  BuyFields.Free;
  BuyFieldsSearch.Free;
  GroupsSearch.Free;
end;

function TFrmMain.GetGroupIDByName(GroupName: String): Integer;
begin
  Result := -1;
  FDQ.SQL.Text := 'SELECT * FROM ' + arTabNameStr[tnGroupsTable] +
                  ' WHERE group_name = ''' + GroupName + '''';
  FDQ.Open;
  if FDQ.IsEmpty then Exit;
  Result := FDQ.FieldByName('id').AsInteger;
end;

function TFrmMain.GetImageDir(ID: integer): String;
begin
  FDQ.SQL.Text := 'SELECT directory FROM ' + arTabNameStr[tnImagesTable] +
                  ' WHERE ID = ' + ID.ToString;
  FDQ.Open;
  if FDQ.IsEmpty then
    Result := ''
  else
    Result := FDQ.Fields[0].AsString;
  FDQ.Close;
end;

function TFrmMain. GenerateNewImageDir(index: integer): string;
begin
  Result := IntToStr(index);
  if Length(Result) < 6 then
    Result := 'img' + StringOfChar('0', 6 - Length(Result)) + Result
  else
    Result := 'img' + Result;
end;

procedure TFrmMain.JvChCmBoxViewSelectedGroupsChange(Sender: TObject);
begin
  var GR: TGroupRec;
  for var i: integer := 0 to JvChCmBoxViewSelectedGroups.Items.Count -1 do
  begin
    GR := GroupsSearch.Items[JvChCmBoxViewSelectedGroups.Items[i]];
    GR.checket := JvChCmBoxViewSelectedGroups.Checked[i];
    GroupsSearch.AddOrSetValue(JvChCmBoxViewSelectedGroups.Items[i], GR);
  end;

  // JvChCmBoxViewSelectedGroups.Items.Text;
  //RG := GroupsSearch.Items[]
  //GroupsSearch.AddOrSetValue()
  UpdateMainTable;
end;

procedure TFrmMain.JvDBGBuyCellClick(Column: TColumn);
var
  DirImages: String;
  img_id: Integer;
begin
  if FDQBuy.IsEmpty or (not ChBoxImagesViewer.Checked) then Exit;

  DirImages := FDQBuy.FieldByName('directory').AsString;

  if DirImages = '' then
  begin
    DirImages := FDQBuy.FieldByName(arBuyTabFieldsName[8]).AsString;
    if DirImages = '' then
       DirImages := 'ID_' + FDQBuy.FieldByName(arBuyTabFieldsName[0]).AsString;
    DirImages := DBImagesDir + '\' + DirImages;
  end
  else
    DirImages := DBImagesDir + '\' + DirImages;
  JvImagesViewer.Directory := DirImages;

end;

procedure TFrmMain.jvdpeGuaranteeLastDateClick(Sender: TObject);
begin
  SetGuaranteeLastDate;
end;

procedure TFrmMain.JvDragDropDrop(Sender: TObject; Pos: TPoint;
  Value: TStrings);
var
  img_id: integer;
  ImageDir: string;
  i: integer;
  file_ext: String;
  id_msg_result: Integer;
  RN: Integer;
begin
  if FDQBuy.IsEmpty
    or (FDQBuy.FieldByName(arBuyTabFieldsName[0]).Value = -1)
  then
    Exit;

   id_msg_result := MessageBox(Handle,
         PChar('Если необходимо переместить файл(ы) в директорию программы то нажмите: ' + #13#10 +
               '"Да" - файлы будут перемещены' + #13#10 +
               '"Нет" - файлы будут скопированы'),
                        PChar(MB_CAPTION),
                        MB_YESNOCANCEL or MB_ICONQUESTION);

   if id_msg_result = ID_CANCEL then Exit;

  if FDQBuy.FieldByName(arBuyTabFieldsName[12]).IsNull then
  begin
    // Если нет image_id т.е. картинки добавляются в первые
    img_id := NewImageID;
    FDQBuy.Edit;
    FDQBuy.FieldByName(arBuyTabFieldsName[12]).Value := img_id;
    FDQBuy.Post;
  end
    else
  begin
    // если image_id уже есть
    img_id := FDQBuy.FieldByName(arBuyTabFieldsName[12]).AsInteger;
  end;

  ImageDir := DBImagesDir + PathDelim + GetImageDir(img_id);

  // Создаю директорию, если не существует;
  // Create a directory if it does not exist
  if Not TDirectory.Exists(ImageDir) then
    TDirectory.CreateDirectory(ImageDir);

  // Перемещение или копинрование файлов
  for i:=0 to Value.Count -1 do
  begin
    // Directory checking
    if TDirectory.Exists(Value[i]) then Continue;

    // File extension checking
    file_ext := LowerCase(ExtractFileExt(Value[i]));
    if MatchStr(file_ext, arFileMask) then
    begin
      case  id_msg_result of
        ID_YES:
          begin
            // Перемещение файлов
            Tfile.Move(Value[i], Imagedir + PathDelim + ExtractFileName(Value[i]));
          end;
        ID_NO:
          begin
            // Копирование файлов
            Tfile.Copy(Value[i], Imagedir + PathDelim + ExtractFileName(Value[i]), true);
          end;
      end;

    end;
  end;

 // Перемещение или копирование директории не предусмитрено

 mm.Lines.Add('FDQBuy.RecNo = ' + FDQBuy.RecNo.ToString);

 //RN := FDQBuy.RecNo;
 //UpdateMainTable;
 //FDQBuy.RecNo := RN;
 //JvDBGBuy.SelectedIndex := RN;

 JvImagesViewer.Directory := Imagedir;
 JvImagesViewer.LoadImages;

end;

procedure TFrmMain.JvImagesViewerDblClick(Sender: TObject);
begin
  FrmImageViewer.ShowModal;
  {

  if JvImagesViewer.Count = 0 then Exit;
  ShellExecute(Handle, PChar('open'),
        PChar(JvImagesViewer.Items[JvImagesViewer.SelectedIndex].FileName),
        Nil, Nil, SW_NORMAL);
       }
end;

procedure TFrmMain.log(StrValue: String);
begin
  FSTLog.Add(StrValue);
  mm.Lines.Add(StrValue);
end;

procedure TFrmMain.MM_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.MM_OpenFrmUpdateClick(Sender: TObject);
begin
  FrmGitUpdate.ShowModalInit;
end;

procedure TFrmMain.MM_OpenGitHubClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('open'), PChar(GitHubLink), Nil, Nil, SW_NORMAL);
end;

procedure TFrmMain.MM_OpenSettingsClick(Sender: TObject);
begin
  if ChBoxBuyTabEditMode.Checked then
  begin
    MessageBox(Handle, PChar('Что бы войти в настройки завершите редактирование и закройте режим ввода'),
               PChar(MB_CAPTION), MB_ICONINFORMATION);
    exit;
  end;
  FrmSettings.ShowModal;
end;

procedure TFrmMain.MM_TestClick(Sender: TObject);
begin
  // for debug
  mm.Lines.Add('TFrmMain.MM_TestClick:');
end;

procedure TFrmMain.MoveImagesToNewDir;
var
  prod_id, buy_id: string;
  img_id: Integer;
  NewImageDir: String;
  img_counter: integer;
begin

  for var i: integer := 0 to FDQBuy.FieldCount -1 do
  begin
    mm.Lines.Add(FDQBuy.Fields[i].FieldName);
  end;

  img_counter := 97;

  FDQBuy.First;
  while not FDQBuy.Eof do
  begin

    // Если нет image_id
    if FDQBuy.FieldByName('image_id').IsNull then
    begin

      // Если есть код товара
      prod_id := FDQBuy.FieldByName('product_id').AsString;

      if prod_id <> '' then
      begin
        // Если есть директория по коду товара
        if TDirectory.Exists(DBImagesDir + '\' + prod_id) then
        begin

          // Проверяю есть ли с таким кодом товара связанный image_id
          FDQ.SQL.Text := 'SELECT * FROM BuyTab WHERE product_id = :p1 AND (image_id IS NOT NULL)';
          FDQ.Params[0].AsString := prod_id;
          FDQ.Open;

          if FDQ.IsEmpty then
          begin
            // С таким кодом товара связаного image_id не оказалось

            // inc(img_counter);
            // img_id := img_counter;
            // NewImageDir := DBImagesDir + '\' +  GenerateNewImageDir(img_id);

            img_id := NewImageID;
            NewImageDir := DBImagesDir + '\' + GetImageDir(img_id);
            TDirectory.Copy(DBImagesDir + '\' + prod_id, NewImageDir);
            mm.Lines.Add('1 Copy ' + DBImagesDir + '\' + prod_id + ' to ' +  NewImageDir);

          end
          else
          begin
            // С таким кодом товара уже есть связанный image_id
            img_id := FDQ.FieldByName('image_id').AsInteger;
          end;

          // записываю новый image_id
          FDQBuy.Edit;
          FDQBuy.FieldByName('image_id').AsInteger := img_id;
          FDQBuy.Post;
          mm.Lines.Add('existes image_id + product_id  FDQBuy.FieldByName("image_id").AsInteger := img_id ');

        end;

      end
      else
      begin

        // Если есть директория по Buy ID записи товара
        buy_id := 'ID_' + FDQBuy.FieldByName('id').AsString;

        if TDirectory.Exists(DBImagesDir + '\' + buy_id) then
        begin
          // inc(img_counter);
          // img_id :=  img_counter;  // NewImageID;
          img_id := NewImageID;
          mm.Lines.Add('FDQBuy.FieldByName(''image_id'').AsInteger := img_id');

          FDQBuy.Edit;
          FDQBuy.FieldByName('image_id').AsInteger := img_id;
          FDQBuy.Post;

          // NewImageDir := DBImagesDir + '\' +  GenerateNewImageDir(img_id);;
          NewImageDir := DBImagesDir + '\' +  GetImageDir(img_id);
          TDirectory.Copy(DBImagesDir + '\' + buy_id, NewImageDir);
          mm.Lines.Add('2 Copy ' + DBImagesDir + '\' + buy_id + ' to ' + NewImageDir);
        end;
      end;

    end;
    sleep(50);
    FDQBuy.Next;
    Application.ProcessMessages;
  end;
end;

function TFrmMain.NewImageID: Integer;
begin
  FDQ.SQL.Text := 'SELECT * FROM ' +  arTabNameStr[tnImagesTable];
  FDQ.Open;
  FDQ.Insert;
  FDQ.Post;
  FDQ.Edit;
  Result := FDQ.FieldByName('ID').AsInteger;
  FDQ.FieldByName('directory').asstring := GenerateNewImageDir(Result);
  FDQ.Post;
  FDQ.Close;
end;

procedure TFrmMain.PageControlChange(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
   0:
      begin
        JvChCmBoxFieldsSearchBuy.Visible  := true;
        JvChCmBoxFieldsSearchSell.Visible := false;
      end;
   1:
      begin
        JvChCmBoxFieldsSearchBuy.Visible  := false;
        JvChCmBoxFieldsSearchSell.Visible := true;
      end;
  end;
end;

procedure TFrmMain.PM_CloneRecordClick(Sender: TObject);
Var
  i: SmallInt;
  arFildsSave: array[0..High(arBuyTabFieldsName)] of string;
  msk: string;
begin
  if (FDQBuy.IsEmpty) then Exit;
  (*
  + id,                                   // 0 ID
  | + date_buy                            // 1 Дата покупки
  | | + product_name                      // 2 Название товара
  | | | + count                           // 3 Количество
  | | | | + buy_price                     // 4 Цена
  | | | | | + guarant_period              // 5 Срок гарантии
  | | | | | | + guarant_last_date         // 6 Дата истечения гарантии
  | | | | | | | + shop_name               // 7 Название магазина
  | | | | | | | | + product_id            // 8 Код товара в магазине
  | | | | | | | | | + seller_phone        // 9 Телефон продавца
  | | | | | | | | | | + seller_name       // 10 Имя продавца
  | | | | | | | | | | | + web_page        // 11 Веб страница
  | | | | | | | | | | | | + image_id      // 12 id директории картинок
  | | | | | | | | | | | | | + item_state // 13 Состояние вещи
  | | | | | | | | | | | | | |
  0 0 1 0 1 1 0 1 1 0 0 1 1 0

  0 - Нет переноса записи поля
  1 - Перенос *)

  msk := '00101101100110';

  for i := 0 to High(arBuyTabFieldsName) do
  begin
    //mm.Lines.Add('msk = ' + msk[i+1] + ' ' + FDQBuy.Fields[i].AsString);
    if msk[i+1] = '1' then arFildsSave[i] := FDQBuy.Fields[i].AsString;
  end;

  FDQBuy.Insert;
  for i := 0 to High(arBuyTabFieldsName) do
  begin
    //mm.Lines.Add('msk = ' + msk[i+1] + ' ' + FDQBuy.Fields[i].AsString);
    if msk[i+1] = '1' then FDQBuy.Fields[i].AsString := arFildsSave[i];
  end;

end;

procedure TFrmMain.PM_OpenWebPageClick(Sender: TObject);
var
  i: SmallInt;
  link: string;
begin
  if (FDQBuy.IsEmpty) then Exit;
  if FDQBuy.FieldByName('web_page').AsString = '' then exit;
  //ShellExecute(Handle, PChar('open'),
  //   PChar(FDQBuy.FieldByName('web_page').AsString), Nil, Nil, SW_NORMAL);

  if DBMemoWebPage.Lines.Count > 1 then
  begin
    with FrmSelectWebPage do
    begin
      InitShowModal;
      if ModalResult = mrCancel then Exit;
      for i := 0 to JvChListBoxWebPage.Count -1 do
        if JvChListBoxWebPage.Checked[i] then
        begin
          link := JvChListBoxWebPage.Items[i];
          if LeftStr(LowerCase(link), 4) <> 'www.' then link := 'www.' + link;
          ShellExecute(Handle, PChar('open'),PChar(link), Nil, Nil, SW_NORMAL);
        end;
    end
  end
    else
  begin
    link := FDQBuy.FieldByName('web_page').AsString;
    if LeftStr(LowerCase(link), 4) <> 'www.' then link := 'www.' + link;
    ShellExecute(Handle, PChar('open'), PChar(link), Nil, Nil, SW_NORMAL);
  end;
end;

procedure TFrmMain.PopMenuDBGPopup(Sender: TObject);
begin
  if Not FDQBuy.FieldByName('web_page').IsNull then
    PM_OpenWebPage.Visible := True
  else
    PM_OpenWebPage.Visible := false;

  if FDQBuy.RecordCount > 1 then
    PM_CloneRecord.Visible := ChBoxBuyTabEditMode.Checked;
end;

procedure TFrmMain.Search;
var
  SearchStr: string;
  ADD_OR   : String;
  i        : ShortInt;
  SqlStr   : String;
  GroupsChecked: Boolean;
begin
  GroupsChecked := false;
  SearchStr := '''%' + lblEdSearch.Text + '%''';
  if JvChCmBoxViewSelectedGroups.CheckedCount > 0 then
    GroupsChecked := true;

  case PageControl.ActivePageIndex of
    0: begin
         with FDQBuy do
         begin
           Close;
           ADD_OR := '';
           SQL.Clear;
           SqlStr := 'SELECT * FROM ' + arTabNameStr[tnBuyTable] +
                    ' LEFT OUTER JOIN ' + arTabNameStr[tnImagesTable] +
                    ' ON ' + arTabNameStr[tnBuyTable] + '.image_id = ' +
                    arTabNameStr[tnImagesTable] + '.id';
           if GroupsChecked then
             SqlStr :=  SqlStr + ', ' + arTabNameStr[tnBuyGroupTable];
           SQL.Add(SqlStr);
           SqlStr := '';
           SQL.Add('WHERE');

           if GroupsChecked then
             SQL.Add('(');
           if JvChCmBoxFieldsSearchBuy.CheckedCount = 0 then
           begin
             for var ItemPair in BuyFieldsSearch do
             begin
               if (ItemPair.Value = arBuyTabFieldsName[1]) or (ItemPair.Value = arBuyTabFieldsName[6]) then
                 SQL.Add(ADD_OR + 'strftime(''%d.%m.%Y'', ' + ItemPair.Value + ') LIKE ' + SearchStr)
               else
                 SQL.Add(ADD_OR + ItemPair.Value + ' LIKE ' + SearchStr);
               ADD_OR := 'OR ';
             end;
           end
           else
           begin
             for i:= 0 to JvChCmBoxFieldsSearchBuy.Items.Count -1 do
             begin
               if Not JvChCmBoxFieldsSearchBuy.Checked[i] then
                 Continue;
               var field := BuyFieldsSearch.Items[JvChCmBoxFieldsSearchBuy.Items[i]];
               if (field = arBuyTabFieldsName[1]) or (field = arBuyTabFieldsName[6]) then
                 SQL.Add(ADD_OR + 'strftime(''%d.%m.%Y'', ' + field + ') LIKE ' + SearchStr)
               else
                 SQL.Add(ADD_OR + field + ' LIKE ' + SearchStr);
               ADD_OR := 'OR ';
             end;
           end;

           if GroupsChecked then
           begin
             SQL.Add(')');
             SQL.Add('AND');
             SQL.Add('(');
             SQL.Add('(BuyGrouptab.buy_id = BuyTab.id)');
             for var ItemPair in GroupsSearch do
               if ItemPair.Value.checket then
                 SqlStr := SqlStr + 'AND (BuyGrouptab.group_id = ' +
                           ItemPair.Value.id.ToString + ') ';
             SQL.Add(TrimRight(SqlStr)+')');
           end;

           SQL.Add('ORDER BY ' + arBuyTabFieldsName[1] + ' ASC');
           mm.Lines.Add('');         // for debug
           mm.Lines.AddStrings(SQL); // for debug
           Open;
         end;
       end;

    1: // Search for Sell table
       begin
         // in the future will be completed
       end;
  end;

  UpdateStatusBar;
end;

procedure TFrmMain.SetCheckedSelectedGroups(BuyId: Integer);
var
  BuyGrTab, GroupTab: String;
  GroupName: string;
  x: integer;
begin
  BuyGrTab := arTabNameStr[tnBuyGroupTable];
  GroupTab := arTabNameStr[tnGroupsTable];

  FDQ.SQL.Text := 'SELECT ' + GroupTab + '.group_name FROM ' + BuyGrTab + ', ' + GroupTab +
                  ' WHERE (buy_id = :p1) AND (group_id = ' + GroupTab + '.id)';
  FDQ.Params[0].AsInteger := BuyId;
  FDQ.Open;

  for x := 0 to JvChCmBoxSelectGroups.Items.Count -1 do
    JvChCmBoxSelectGroups.Checked[x] := false;

  if FDQ.IsEmpty then Exit;

  FDQ.First;
  while Not FDQ.Eof do
  begin
    GroupName := FDQ.FieldByName('group_name').AsString;
    x := JvChCmBoxSelectGroups.Items.IndexOf(GroupName);
    if x <> -1 then JvChCmBoxSelectGroups.Checked[x] := true;
    FDQ.Next;
  end;

end;

procedure TFrmMain.SetDBEditControls(TabName: TTablesName);
var
  StrValue: string;
begin
  case TabName of

    tnBuyTable:
      begin
        FDQ.SQL.Text := 'SELECT DISTINCT ' + arBuyTabFieldsName[7] + ' FROM ' + arTabNameStr[TabName];
        FDQ.Open;
        if Not FDQ.IsEmpty then
        begin
          DBCmBoxSelectShop.Items.Clear;
          FDQ.First;
          while Not FDQ.Eof do
          begin
            StrValue := FDQ.FieldByName(arBuyTabFieldsName[7]).AsString;
            if StrValue <> '' then DBCmBoxSelectShop.Items.Add(StrValue);
            FDQ.Next;
          end;
        end;

        // 5 Срок гарантии
        FDQ.SQL.Text := 'SELECT DISTINCT ' + arBuyTabFieldsName[5] + ' ' +
                        'FROM ' + arTabNameStr[TabName] + ' ' +
                        'ORDER BY ' + arBuyTabFieldsName[5] + ' ASC';
        FDQ.Open;
        if Not FDQ.IsEmpty then
        begin
          DBCmBoxGuarantPeriod.Items.Clear;
          FDQ.First;
          while Not FDQ.Eof do
          begin
            StrValue := FDQ.FieldByName(arBuyTabFieldsName[5]).AsString;
            if StrValue <> '' then DBCmBoxGuarantPeriod.Items.Add(StrValue);
            FDQ.Next;
          end;
        end;
      end;

    tnSellTable:
      begin
        // in the future will be completed
      end;
  end;
end;

procedure TFrmMain.SetFieldsSearch(TabName: TTablesName);
var
   i: ShortInt;
   field: string;
begin

  JvChCmBoxFieldsSearchBuy.Clear;
  JvChCmBoxFieldsSearchSell.Clear;

  for i := 0 to High(arBuyTabFieldsName) do
  begin
    field := arBuyTabFieldsName[i];
    if CheckFlag(BuyFields.items[field].FPD_FLAGS, FPD_FIELD_SEARCHE) then
    begin
      BuyFieldsSearch.Add(BuyFields.items[field].Caption, field);
      JvChCmBoxFieldsSearchBuy.Items.Add(BuyFields.items[field].Caption);
    end;
  end;

  for i := 0 to JvChCmBoxFieldsSearchBuy.Items.Count -1 do
  begin
    field := JvChCmBoxFieldsSearchBuy.Items[i];
    field := BuyFieldsSearch.Items[field];
    JvChCmBoxFieldsSearchBuy.Checked[i] := CheckFlag(BuyFields.Items[field].FPD_FLAGS, FPD_FIELD_CHECKET);
  end;


     // for i := 1 to High(arBuyTabFieldsCaption) do
     //              JvChCmBoxFieldsSearch.Items.Add(arBuyTabFieldsCaption[i]);

  for i := 1 to High(arSellTabFieldsCaption) do
    JvChCmBoxFieldsSearchSell.Items.Add(arSellTabFieldsCaption[i]);


  //if JvChCmBoxFieldsSearch.Items.Count <> 0 then
  //  JvChCmBoxFieldsSearch.Checked[1] := true;

end;

procedure TFrmMain.SetFieldsDefault(TabName: TTablesName);
var
  i: ShortInt;
begin
  if TabName in [tnAll, tnBuyTable] then
  begin
    for i := 0 to High(arBuyTabFieldsName) do
    begin
      with JvDBGBuy.Columns.Add do
      begin
        FieldName        := arBuyTabFieldsName[i];
        Title.Caption    := arBuyTabFieldsCaption[i];
        Title.Alignment  := arBuyFieldsAlignment[i];
        Title.Font.Style := [fsBold];
        //Title.Font.Size  := 10;
        Alignment        := arBuyFieldsAlignment[i];
        Width            := arBuyFieldsWidth[i];
        if i = 0 then Visible := false else Visible := true;
      end;
    end;
  end;

  if TabName in [tnAll, tnSellTable] then
  begin
    for i := 0 to High(arSellTabFieldsName) do
    begin
      with JvDBGSell.Columns.Add do
      begin
        FieldName        := arSellTabFieldsName[i];
        Title.Caption    := arSellTabFieldsCaption[i];
        Title.Font.Style := [fsBold];
        //Title.Font.Size  := 10;
        Title.Alignment  := arSellFieldsAlignment[i];
        Alignment        := arSellFieldsAlignment[i];
        Width            := arSellFieldsWidth[i];
        if i = 0 then Visible := false else Visible := true;
      end;
    end;
  end;

end;

procedure TFrmMain.SetGuaranteeLastDate;
begin
  if (JvdpeDateBuy.Text = '') or (DBCmBoxGuarantPeriod.Text = '') then Exit;
  jvdpeGuaranteeLastDate.Date := IncMonth(JvdpeDateBuy.Date, StrToInt(DBCmBoxGuarantPeriod.Text));
end;

procedure TFrmMain.SetControlSelectedGroups;
begin
  FDQ.SQL.Text :=  'SELECT * FROM ' + arTabNameStr[tnGroupsTable];
  FDQ.Open;
  FDQ.First;
  if Not FDQ.IsEmpty then
  begin
    JvChCmBoxSelectGroups.Clear;
    JvChCmBoxViewSelectedGroups.Clear;
    FDQ.First;
    while Not FDQ.Eof do
    begin
      var GroupName := FDQ.FieldByName('group_name').AsString;
      var GR: TGroupRec;
      JvChCmBoxSelectGroups.Items.Add(GroupName);
      JvChCmBoxViewSelectedGroups.Items.Add(GroupName);
      GR.id      := FDQ.FieldByName('id').AsInteger;
      GR.checket := false;
      GroupsSearch.Add(GroupName, GR);
      FDQ.Next;
    end;
  end;
end;

procedure TFrmMain.SpBtnBuyTabColAutoSizeClick(Sender: TObject);
begin
  JvDBGBuy.AutoSizeColumns := true;
  JvDBGBuy.AutoSizeColumns := false;
end;

procedure TFrmMain.SpBtnBuyTabColSaveClick(Sender: TObject);
begin
  JvDBGBuy.Columns.SaveToFile(FileBuyTabColSettings);
end;

procedure TFrmMain.SpBtnEditGroupsClick(Sender: TObject);
begin
  FrmEditGroups.ShowModal;
end;

procedure TFrmMain.SpBtnSellTabColAutoSizeClick(Sender: TObject);
begin
  JvDBGSell.AutoSizeColumns := true;
  JvDBGSell.AutoSizeColumns := false;
end;

procedure TFrmMain.SpBtnSellTabColSaveClick(Sender: TObject);
begin
  JvDBGSell.Columns.SaveToFile(FileSellTabColSettings);
end;

function TFrmMain.TableExistes(TableName: String): boolean;
begin
  try
    FDQ.SQL.text := 'SELECT * FROM sqlite_master WHERE Name = :p1';
    FDQ.Params[0].Value := TableName;
    FDQ.Open;
    Result := Not FDQ.IsEmpty;
  Except
    Result := false;
  end;
end;

procedure TFrmMain.UpdateMainTable;
var
  SqlStr: String;
  GroupsChecked: Boolean;
begin
  FDQBuy.SQL.Clear;
  GroupsChecked := false;
  SqlStr := 'SELECT * FROM BuyTab LEFT OUTER JOIN ImagesTab ' +
              'ON BuyTab.image_id = ImagesTab.id';

  if JvChCmBoxViewSelectedGroups.CheckedCount > 0 then
  begin
    GroupsChecked := true;
    SqlStr := SqlStr + ', ' + arTabNameStr[tnBuyGroupTable];
  end;

  FDQBuy.SQL.Add(SqlStr);

  if GroupsChecked then
  begin
    FDQBuy.SQL.Add('WHERE');
    SqlStr := '(BuyGrouptab.buy_id = BuyTab.id)';
    for var FieldPair in GroupsSearch do
    begin
      if FieldPair.Value.checket then
        SqlStr := SqlStr + ' AND BuyGrouptab.group_id = ' +
                   FieldPair.Value.id.ToString
    end;
    FDQBuy.SQL.Add(SqlStr);
  end;

  // for debug
  mm.Lines.Add('');
  mm.Lines.Add('UpdateMainTable:');
  mm.Lines.Add(FDQBuy.SQL.Text);

  FDQBuy.Open;
  UpdateStatusBar;
end;

procedure TFrmMain.UpdateStatusBar;
var
  i: Integer;
begin
  JvDBGBuy.BeginUpdate;
  DSBuy.Enabled := false;
  i := 0;
  FDQBuy.First;
  while FDQBuy.Eof = false do
  begin
    i := i + FDQBuy.FieldByName('buy_price').AsInteger;
    FDQBuy.Next;
  end;
  FDQBuy.First;
  DSBuy.Enabled := true;
  JvDBGBuy.EndUpdate;
  StatusBar.Panels[0].Text := 'Записей: ' + IntToStr(FDQBuy.RecordCount);
  StatusBar.Panels[1].Text := 'Сумма: ' + IntToStr(i);
end;

end.

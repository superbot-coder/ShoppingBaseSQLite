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
  JvCustomItemViewer, JvImagesViewer, skia.Vcl, GetVer, ShlObj, ExplorerShowFiles;

type TSortType = (stASC, stDESC);
type TTablesName = (tnAll, tnBuyTable, tnSellTable, tnGroupsTable,
                    tnBuySellTable, tnBuyGroupTable);

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
    JvChCmBoxFieldsSearch: TJvCheckedComboBox;
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
  private
    FSTLog: TStrings;
    FFieldLastSorted: string;
    FSortingDirection: TSortType;
    procedure UpdateStatusBar;
    Procedure AddShops;
    procedure CreateTables(TabName: TTablesName);
    procedure log(StrValue: String);
    function TableExistes(TableName: String): boolean;
    procedure SetFieldsDefault(TabName: TTablesName);
    procedure SaveColumnsSettings;
    procedure LoadColumnsSettings;
    procedure SetFeldsSearch(TabName: TTablesName);
    procedure SetDBEditControls(TabName: TTablesName);
    procedure SetCheckedSelectedGroups(BuyId: Integer);
    procedure SetGuaranteeLastDate;
    procedure UpdateControlSelectedGroups;
    function GetGroupIDByName(GroupName: String): Integer;
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
  SystemColorWindow: TColor;

  arTabNameStr: array[TTablesName] of string =
    ('AllTab', 'BuyTab', 'SellTab', 'GroupsTab', 'BuySellTab', 'BuyGroupTab');

  arBuyTabFieldsName: array[0..11] of string = (
    'id',                // 0 ID
    'date_buy',          // 1 Дата покупки
    'product_name',      // 2 Название товара
    'count',             // 3 Количество
    'buy_price',         // 4 Цена
    'guarant_period',    // 5 Срок гарантии
    'guarant_last_date', // 6 Дата истечения гарантии
    'shop_name',         // 7 Название магазина
    'product_id',        // 8 Код товара в магазине
    'seller_phone',      // 9 Телефон продавца
    'seller_name',       // 10 Имя продавца
    'web_page');         // 11 Веб страница

  arBuyTabFieldsCaption: array[0..High(arBuyTabFieldsName)] of string = (
    'ID',
    'Дата покупки',
    'Название товара',
    'Количество',
    'Цена',
    'Срок гарантии',
    'Дата истечения гарантии',
    'Магазин',
    'Код товара в магазине',
    'Телефон продавца',
    'Имя продавца',
    'Веб страница');

  arBuyFieldsWidth: array[0..High(arBuyTabFieldsName)] of Word = (
     50,   // 0 ID
     100,  // 1 Дата покупки
     300,  // 2 Название товара
     50,   // 3 Количество
     100,  // 4 Цена
     50,   // 5 Срок гарантии
     100,  // 6 Дата истечения гарантии
     100,  // 7 Название магазина
     50,   // 8 Код товара в магазине
     150,  // 9 Телефон продавца
     150,  // 10 Имя продавца;
     150); // 11 Веб страница

  arBuyFieldsAlignment: array[0.. High(arBuyTabFieldsName)] of TAlignment = (
     taCenter,       // 0 ID
     taCenter,       // 1 Дата покупки
     taLeftJustify,  // 2 Название товара
     taCenter,       // 3 Количество
     taCenter,       // 4 Цена
     taCenter,       // 5 Срок гарантии
     taCenter,       // 6 Дата истечения гарантии
     taCenter,       // 7 Название магазина
     taCenter,       // 8 Код товара в магазине
     taCenter,       // 9 Телефон продавца
     taLeftJustify,  // 10 Имя продавца;
     taLeftJustify); // 11 Веб страница

  arSellTabFieldsName: array[0..6] of string = (
    'id',           // 0 ID
    'date_sell',    // 1 Дата продажи
    'product_name', // 2 Название товара
    'count',        // 3 Количество
    'sell_price',   // 4 Цена продажи
    'buyer_phone',  // 5 Телефон покупателя
    'bayer_name');  // 6 Имя покупателя

  arSellTabFieldsCaption: array[0..High(arSellTabFieldsName)] of string = (
    'ID',
    'Дата продажи',
    'Название товара',
    'Количество',
    'Цена продажи',
    'Телефон покупателя',
    'Имя покупателя');

  arSellFieldsWidth: array[0..High(arSellTabFieldsName)] of Word = (
     50,    // 0 ID
     100,   // 1 Дата продажи
     300,   // 2 Название товара
     50,    // 3 Количество
     100,   // 4 Цена продажи
     150,   // 5 Телефон покупателя
     150);  // 6 Имя покупателя

  arSellFieldsAlignment: array[0.. High(arSellTabFieldsName)] of TAlignment = (
     taCenter,       // 0 ID
     taCenter,       // 1 Дата продажи
     taLeftJustify,  // 2 Название товара
     taCenter,       // 3 Количество
     taCenter,       // 4 Цена продажи
     taLeftJustify,  // 5 Телефон покупателя
     taLeftJustify); // 6 Имя покупателя



const
  GitHubLink = 'https://github.com/superbot-coder/ShoppingBaseSQLite';
  MB_CAPTION = 'Shopping History';

implementation

USES UfrmEditGroups, UFrmSelectWebPage, UFrmSettings, UFrmImageViewer, UFrmGitUpdate;

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
var
  find: string;
  Query: TFDQuery;
  SearchStr: string;
  ADD_OR   : String;
  i        : ShortInt;
begin

  SearchStr := '''%' + lblEdSearch.Text + '%''';

  case PageControl.ActivePageIndex of
    0: begin
         with FDQBuy do
         begin
           Close;
           ADD_OR := '';
           SQL.Clear;
           SQL.Add('SELECT * FROM ' + arTabNameStr[tnBuyTable]);
           SQL.Add('WHERE');
           if JvChCmBoxFieldsSearch.Text = '' then
           begin
             for i:= 1 to High(arBuyTabFieldsName) do
             begin
               if i = 1 then
                 SQL.Add('strftime(''%d.%m.%Y'', ' + arBuyTabFieldsName[i] + ') LIKE ' + SearchStr);
               if i = 6 then
                 SQL.Add('OR strftime(''%d.%m.%Y'', ' + arBuyTabFieldsName[i] + ') LIKE ' + SearchStr);
               SQL.Add('OR ' + arBuyTabFieldsName[i] + ' LIKE ' + SearchStr);
             end;
           end
             else
           begin
             for i:= 0 to JvChCmBoxFieldsSearch.Items.Count -1 do
             begin
               if (i+1 = 1) or (i+1 = 6) then
               begin
                 if JvChCmBoxFieldsSearch.Checked[i] then
                 begin
                   SQL.Add(ADD_OR + 'strftime(''%d.%m.%Y'', ' + arBuyTabFieldsName[i+1] + ') LIKE ' + SearchStr);
                   ADD_OR := 'OR ';
                 end;
               end;
               if JvChCmBoxFieldsSearch.Checked[i] then
               begin
                 SQL.Add(ADD_OR + arBuyTabFieldsName[i+1] + ' LIKE ' + SearchStr);
                 ADD_OR := 'OR ';
               end;
             end;
           end;
           SQL.Add('ORDER BY ' + arBuyTabFieldsName[1] + ' ASC');
           Open;
         end;
       end;
    1: begin
         //
       end;
  end;

  UpdateStatusBar;
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

procedure TFrmMain.ChBoxBuyTabEditModeClick(Sender: TObject);
begin
  if ChBoxBuyTabEditMode.Checked then
  begin
    DBNavigatorBuyTab.Enabled := true;
    PanelEditBuy.Visible      := true;
    SetDBEditControls(tnBuyTable);
    UpdateControlSelectedGroups;
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
        arBuyTabFieldsName[11] + ' VARCHAR)';            // Веб страница
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
  mm.Lines.Add('DBNavigatorBuyTabClick dbeProductName.Text = '+dbeProductName.Text);
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
    UpdateControlSelectedGroups;
    SetFieldsDefault(tnAll);
    SetFeldsSearch(tnBuyTable);


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

  //BtnSearchCloseClick(Nil);

end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FSTLog.Free;
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

procedure TFrmMain.JvDBGBuyCellClick(Column: TColumn);
var
  DirImages: String;
begin
  if FDQBuy.IsEmpty or (not ChBoxImagesViewer.Checked) then Exit;
  DirImages := FDQBuy.FieldByName(arBuyTabFieldsName[8]).AsString;
  if DirImages = '' then
     DirImages := 'ID_' + FDQBuy.FieldByName(arBuyTabFieldsName[0]).AsString;

  DirImages := DBImagesDir + '\' + DirImages;
  JvImagesViewer.Directory := DirImages;
end;

procedure TFrmMain.jvdpeGuaranteeLastDateClick(Sender: TObject);
begin
  SetGuaranteeLastDate;
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

procedure TFrmMain.LoadColumnsSettings;
var
  STInp: TStrings;
  Bytes: TBytes;
  RootArray : TJSONArray;
  RootObj   : TJSONObject;
  RootVal   : TJSONValue;
  jtxt     : String;
  s         : String;
begin
  STInp := TStringList.Create;

  //Bytes     := TFile.ReadAllBytes(FileColSettings);
  //RootArray := TJSONObject.ParseJSONValue(Bytes, 0) as TJSONArray;
  //ShowMessage(RootArray.ToString);

  try
    STInp.LoadFromFile(FileBuyTabColSettings + '_');
    jtxt := STInp.Text;
    // mm.Lines.Add(STInp.Text);
    // RootObj := TJSONObject.ParseJSONValue(STInp.Text) as TJSONObject;

  finally
    STInp.Free;
  end;

  {
  TEncoding.ASCII.GetBytes(GJSONString)
  RootObj := TJSONObject.Create;
  RootObj.Parse(TEncoding.UTF8.GetBytes(jtext), 0);
  RootObj.Parse(BytesOf(jtext), 0);
  log(RootObj.ToString);
  }

  //RootArray := TJSONObject.Parse(BytesOf(TFile.ReadAllText(FileColSettings)), 0) as TJSONArray;

  //TEncoding.ASCII.GetBytes(GJSONString)

  //Bytes := TFile.ReadAllBytes(FileColSettings);
  //s := TEncoding.UTF8.GetString(Bytes);

  // RootArray := TJSONObject.ParseJSONValue(TFile.ReadAllBytes(FileColSettings), 0) as TJSONArray;
  //RootObj.Parse(BytesOf(s), 0);

  //RootArray := RootObj as TJSONArray;


  RootArray := TJSONObject.ParseJSONValue(TFile.ReadAllBytes(FileBuyTabColSettings + '_'), 0) as TJSONArray;
  jtxt := TFile.ReadAllText(FileBuyTabColSettings+'_', TEncoding.UTF8);

  if RootArray = Nil then
  begin
   log('proc LoadColumnsParams RootArray = Nil');
   Exit;
  end;

  mm.Lines.Add(jtxt);
  mm.Lines.Add(RootArray.ToString);

  log('proc LoadColumnsParams RootArray <> Nil Ok.');

end;

procedure TFrmMain.log(StrValue: String);
begin
  FSTLog.Add(StrValue);
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
var
   s: string;
   STFiles: TStrings;
   FileName : string;
   NewFileName: string;
   cnt: word;
begin
  mm.Lines.AddStrings(FSTLog);

  FileName := 'C:\Users\USER\Downloads\DownloadFile.zip';
  // FileName := FileNameIncrement(FileName);

  mm.Lines.Add('FileName = ' + FileName);
end;

procedure TFrmMain.PageControlChange(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
   0: SetFeldsSearch(tnBuyTable);
   1: SetFeldsSearch(tnSellTable);
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
  id,                             // 0 ID
  | date_buy                      // 1 Дата покупки
  | | product_name                // 2 Название товара
  | | | count                     // 3 Количество
  | | | | buy_price               // 4 Цена
  | | | | | guarant_period        // 5 Срок гарантии
  | | | | | | guarant_last_date   // 6 Дата истечения гарантии
  | | | | | | | shop_name         // 7 Название магазина
  | | | | | | | | product_id      // 8 Код товара в магазине
  | | | | | | | | | seller_phone  // 9 Телефон продавца
  | | | | | | | | | | seller_name // 10 Имя продавца
  | | | | | | | | | | | web_page  // 11 Веб страница
  | | | | | | | | | | | |
  0 0 1 0 1 1 0 1 1 0 0 1   *)

  msk := '001011011001';

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
  PM_CloneRecord.Visible := ChBoxBuyTabEditMode.Checked;
end;

procedure TFrmMain.SaveColumnsSettings;
var
  i: ShortInt;
  arColumns: TJSONArray;
  RootArray: TJSONArray;
  ColObj: TJSONObject;
  TabColObj: TJSONObject;
begin
  RootArray := TJSONArray.Create;
  arColumns := TJSONArray.Create;
  try

    for i := 0 to JvDBGBuy.Columns.Count -1 do
    begin
      ColObj    := TJSONObject.Create;
      ColObj.AddPair('title_caption', JvDBGBuy.Columns.Items[i].Title.Caption)
            .AddPair('field_name', JvDBGBuy.Columns.Items[i].FieldName)
            .AddPair('title_alignment', TJSONNumber.Create(ord(JvDBGBuy.Columns.Items[i].Title.Alignment)))
            .AddPair('alignment', TJSONNumber.Create(ord(JvDBGBuy.Columns.Items[i].Alignment)))
            .AddPair('width', TJSONNumber.Create(JvDBGBuy.Columns.Items[i].Width))
            .AddPair('visible', TJSONBool.Create(JvDBGBuy.Columns.Items[i].visible));
      arColumns.Add(ColObj);
    end;

    TabColObj := TJSONObject.Create;
    TabColObj.AddPair('table_name', 'BuyTab');
    TabColObj.AddPair('columns', arColumns as TJSONValue);
    RootArray.Add(TabColObj);

    // TFile.WriteAllText(FileColSettings, RootArray.ToJSON);

    TFile.WriteAllText(ChangeFileExt(FileBuyTabColSettings, '.json'), TJSON.Format(RootArray));

  finally
    RootArray.Free;
  end;
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

      end;
  end;
end;

procedure TFrmMain.SetFeldsSearch(TabName: TTablesName);
var
   i: ShortInt;
begin
  JvChCmBoxFieldsSearch.Clear;
  case TabName of
    tnBuyTable:  for i := 1 to High(arBuyTabFieldsCaption) do
                   JvChCmBoxFieldsSearch.Items.Add(arBuyTabFieldsCaption[i]);
    tnSellTable: for i := 1 to High(arSellTabFieldsCaption) do
                   JvChCmBoxFieldsSearch.Items.Add(arSellTabFieldsCaption[i]);
  end;
  if JvChCmBoxFieldsSearch.Items.Count <> 0 then
    JvChCmBoxFieldsSearch.Checked[1] := true;
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

procedure TFrmMain.UpdateControlSelectedGroups;
begin
  FDQ.SQL.Text :=  'SELECT * FROM ' + arTabNameStr[tnGroupsTable];
  FDQ.Open;
  if Not FDQ.IsEmpty then
  begin
    JvChCmBoxSelectGroups.Clear;
    while Not FDQ.Eof do
    begin
      JvChCmBoxSelectGroups.Items.Add(FDQ.FieldByName('group_name').AsString);
      JvChCmBoxViewSelectedGroups.Items.Add(FDQ.FieldByName('group_name').AsString);
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
begin
  FDQBuy.SQL.Text := 'SELECT * FROM BuyTab';
  FDQBuy.Open;
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

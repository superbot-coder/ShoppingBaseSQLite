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
    PMenuImagView: TPopupMenu;
    pmivOpenDirImages: TMenuItem;
    pmivOpenDirSelectImage: TMenuItem;
    pmivDeleteImage: TMenuItem;
    pmivDeleteAllImages: TMenuItem;
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
    procedure JvDBGBuyTitleBtnClick(Sender: TObject; ACol: Integer;
      Field: TField);
    procedure pmivOpenDirImagesClick(Sender: TObject);
    procedure pmivOpenDirSelectImageClick(Sender: TObject);
    procedure PMenuImagViewPopup(Sender: TObject);
    procedure pmivDeleteImageClick(Sender: TObject);
    procedure pmivDeleteAllImagesClick(Sender: TObject);
  private
    FDirImages: String;
    FSTLog: TStrings;
    FFieldLastSorted: string;
    FSortingDirection: TSortType;
    function GetDirImages: String;
    procedure UpdateStatusBar;
    Procedure AddShops;
    procedure CreateTables(TabName: TTablesName);
    procedure log(StrValue: String);
    function TableExistes(TableName: String): boolean;
    procedure Search;
    procedure SetCheckedSelectedGroups(BuyId: Integer);
    procedure SetControlSelectedGroups;
    procedure SetDBEditControls(TabName: TTablesName);
    procedure SetFieldsDefault(TabName: TTablesName);
    procedure SetFieldsSearch(TabName: TTablesName);
    procedure SetGuaranteeLastDate;
      procedure SetSortIndexes;
    function GetGroupIDByName(GroupName: String): Integer;
    function GenerateNewImageDir(index: integer): string;
    function GetImageDir(ID: integer): String;
    function NewImageID: Integer;
    procedure MoveImagesToNewDir;
    procedure BuyFieldsListCreate;
    procedure FieldsSearchListCreate;
  public
    { Public declarations }
    property DirImages: String read GetDirImages;
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
  BuyFields         : TDictionary<TBuyFieldsType, TFieldRec>;
  SellFields        : TDictionary<TSellFieldsType, TFieldRec>;
  BuyFieldsSearch   : TDictionary<String, String>;
  GroupsSearch      : TDictionary<string, TGroupRec>;
  Tables            : TDictionary<TTablesName, string>;

  BuyFieldsList     : String;
  SellFieldsList    : String;

const
  GitHubLink = 'https://github.com/superbot-coder/ShoppingBaseSQLite';
  MB_CAPTION = 'Shopping History';

implementation

USES UfrmEditGroups, UFrmSelectWebPage, UFrmSettings, UFrmImageViewer,
     UFrmGitUpdate;

{$R *.dfm}

procedure TFrmMain.AddShops;
begin
  FDQ.SQL.Text := 'SELECT DISTINCT ' + BuyFieldsName.shop_name + ' FROM BuyTab';
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
      SQL.Text := 'SELECT * FROM ' + Tables.Items[tBuyGroupTab] +
                      ' WHERE (buy_id = :p1) and (group_id = :p2)';
      Params.ParamByName('p1').AsInteger := buy_id;
      Params.ParamByName('p2').AsInteger := grp_id;
      Open;

      if JvChCmBoxSelectGroups.Checked[i] = true then
      begin
        if IsEmpty then
        begin
          SQL.Text := 'INSERT INTO ' + Tables.Items[tBuyGroupTab] +
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
          SQL.Text := 'DELETE FROM ' + Tables.Items[tBuyGroupTab] +
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
  var BF := BuyFieldsName;

  // 0 i d
  FR.Name          := BF.id;
  FR.Caption       := 'ID';
  FR.DefWidth      := 50;
  FR.DefAlignment  := taCenter;
  FR.Preset        := [fpCreate];
  BuyFields.Add(bf_id, FR);

  // 1 date_buy
  FR.Name         := BF.date_buy; // 'date_buy';
  FR.Caption      := 'Дата покупки';
  FR.DefWidth     := 100;
  FR.DefAlignment := taCenter;
  FR.Preset       := [fpCreate, fpVisible, fpSearch, fpClone];
  BuyFields.Add(bf_date_buy, FR);

  // 2 product_name
  FR.Name         := BF.product_name; // 'product_name';
  FR.Caption      := 'Название товара';
  FR.DefWidth     := 300;
  FR.DefAlignment := taLeftJustify;
  FR.Preset       := [fpCreate, fpVisible, fpSearch, fpChecket, fpClone];
  BuyFields.Add(bf_product_name, FR);

  // 3 count
  FR.Name         := BF.count; // 'count';
  FR.Caption      := 'Количество';
  FR.DefWidth     := 50;
  FR.DefAlignment := taCenter;
  FR.Preset       := [fpCreate, fpVisible, fpSearch];
  BuyFields.Add(bf_count, FR);

  // 4 buy_price
  FR.Name         := BF.buy_price; //'buy_price';
  FR.Caption      := 'Цена';
  FR.DefWidth     := 100;
  FR.DefAlignment := taCenter;
  FR.Preset        := [fpCreate, fpVisible, fpSearch, fpClone];
  BuyFields.Add(bf_buy_price, FR);

  // 5 guarant_period
  FR.Name         := BF.guarant_period; //'guarant_period';
  FR.Caption      := 'Срок гарантии';
  FR.DefWidth     := 50;
  FR.DefAlignment := taCenter;
  FR.Preset       := [fpCreate, fpVisible, fpSearch, fpClone];
  BuyFields.Add(bf_guarant_period, FR);

  // 6 guarant_last_date
  FR.Name         := BF.guarant_last_date; // 'guarant_last_date';
  FR.Caption      := 'Дата истечения гарантии';
  FR.DefWidth     := 100;
  FR.DefAlignment := taCenter;
  FR.Preset       := [fpCreate, fpVisible, fpSearch, fpClone];
  BuyFields.Add(bf_guarant_last_date, FR);

  // 7 shop_name
  FR.Name         := BF.shop_name; // 'shop_name';
  FR.Caption      := 'Магазин';
  FR.DefWidth     := 100;
  FR.DefAlignment := taCenter;
  FR.Preset       := [fpCreate, fpVisible, fpSearch, fpClone];
  BuyFields.Add(bf_shop_name, FR);

  // 8 Код товара в магазине
  FR.Name         := BF.product_id; // 'product_id';
  FR.Caption      := 'Код товара в магазине';
  FR.DefWidth     := 50;
  FR.DefAlignment := taCenter;
  FR.Preset       := [fpCreate, fpVisible, fpSearch, fpClone];
  BuyFields.Add(bf_product_id, FR);

  // 9 Телефон продавца
  FR.Name         := BF.seller_phone; //'seller_phone';
  FR.Caption      := 'Телефон продавца';
  FR.DefWidth     := 150;
  FR.DefAlignment := taCenter;
  FR.Preset       := [fpCreate, fpVisible, fpSearch, fpClone];
  BuyFields.Add(bf_seller_phone, FR);

  // 10 Имя продавца
  FR.Name         := BF.seller_name;  //'seller_name';
  FR.Caption      := 'Имя продавца';
  FR.DefWidth     := 150;
  FR.DefAlignment := taLeftJustify;
  FR.Preset       := [fpCreate, fpVisible, fpSearch, fpClone];
  BuyFields.Add(bf_seller_name, FR);

  // 11 Веб страница
  FR.Name         := BF.web_page; //'web_page';
  FR.Caption      := 'Веб страница';
  FR.DefWidth     := 150;
  FR.DefAlignment := taLeftJustify;
  FR.Preset       := [fpCreate, fpVisible, fpSearch, fpClone];
  BuyFields.Add(bf_web_page, FR);

  // 12  ID картинок
  // Это поле отображается только для тестирования на период разработки
  FR.Name         := BF.image_id; //'image_id';
  FR.Caption      := 'ID картинок';
  FR.DefWidth     := 50;
  FR.DefAlignment := taCenter;
  FR.Preset       := [fpCreate, fpClone];
  BuyFields.Add(bf_image_id, FR);

  // 13 Состояние
  FR.Name         := BF.item_state; // 'item_state';
  FR.Caption      := 'Состояние';
  FR.DefWidth     := 150;
  FR.DefAlignment := taCenter;
  FR.Preset       := [fpCreate, fpVisible, fpSearch, fpClone];
  BuyFields.Add(bf_item_state, FR);

  for var i: byte := 0 to ord(High(TBuyFieldsType)) do
  begin
    BuyFieldsList := BuyFieldsList + '   ' + Tables.Items[tBuyTab] + '.' +
    BuyFields.items[TBuyFieldsType(i)].Name +',' + #13#10
  end;
  BuyFieldsList := BuyFieldsList + '   ' + Tables.Items[tImagesTab] + '.' + ImagesFieldsName.directory + #13#10;

  // mm.Lines.Add('BuyFieldsList: ' + BuyFieldsList);

end;

procedure TFrmMain.ChBoxBuyTabEditModeClick(Sender: TObject);
begin
  if ChBoxBuyTabEditMode.Checked then
  begin
    DBNavigatorBuyTab.Enabled := true;
    PanelEditBuy.Visible      := true;
    SetDBEditControls(tBuyTab);
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

procedure TFrmMain.CreateTables(TabName: TTablesName);
begin
  with FDQ do
  begin
    // Таблица BuyTable
    if TabName in [tAll, tBuyTab] then
    begin
      var BF := BuyFieldsName;
      SQL.Text := 'CREATE TABLE ' + Tables.Items[tBuyTab] + ' (' +
        {
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
         }
        BF.id           + ' INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1, ' +
        BF.date_buy     + ' DATE NOT NULL, '     + // Дата покупки
        BF.product_name + ' VARCHAR NOT NULL,'   + // Название товара
        BF.count        + ' INTEGER NOT NULL, '  + // Количество
        BF.buy_price    + ' CURRENCY NOT NULL, ' + // Цена
        BF.guarant_period    + ' INTEGER, '           + // Срок гарантии
        BF.guarant_last_date + ' DATE, '              + // Дата истечения гарантии
        BF.shop_name    + ' VARCHAR, '           + // Название магазина
        BF.product_id   + ' VARCHAR, '           + // Код товара в магазине
        BF.seller_phone + ' VARCHAR, '           + // Телефон продавца
        BF.seller_name  + ' VARCHAR, '          + // Имя продавца
        BF.web_page     + ' VARCHAR, '          + // Веб страница
        BF.image_id     + ' INTEGER, '          + // id директории картинок
        BF.item_state   + ' VARCHAR)';            // Состояние вещи

      ExecSQL;
      log('Create Table Name: ' + Tables.Items[tBuyTab]);
    end;

    // Таблица SellTable
    if TabName in [tAll, tSellTab] then
    begin
      SQL.Text := 'CREATE TABLE ' + Tables.Items[tSellTab] + ' (' +
        arSellFields[0] + ' INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
        arSellFields[1] + ' DATA, '              + // Дата продажи
        arSellFields[2] + ' VARCHAR,'            + // Название товара
        arSellFields[3] + ' INTEGER, '           + // Количество
        arSellFields[4] + ' CURRENCY NOT NULL, ' + // Цена продажи
        arSellFields[5] + ' VARCHAR, '           + // Телефон покупателя
        arSellFields[6] + ' VARCHAR)';             // Имя покупателя
      ExecSQL;
      log('Create Table Name: ' + Tables.Items[tSellTab]);
    end;

    // Таблица GroupsTable
    if TabName in [tAll, tGroupsTab] then
    begin
      SQL.Text := 'CREATE TABLE ' + Tables.Items[tGroupsTab] + ' (' +
                  'id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
                  'group_name VARCHAR UNIQUE NOT NULL)'; // Имя группы товара

      ExecSQL;
      log('Create Table Name: ' + Tables.Items[tGroupsTab]);
    end;

    //Таблица BuySellTable
    if TabName in [tAll, tBuySellTab] then
    begin
      SQL.Text := 'CREATE TABLE ' + Tables.Items[tBuySellTab] + ' (' +
                  'id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
                  'buy_id INTEGER NOT NULL, ' + // id записи товара из BuyTab
                  'sell_id INTEGER NOT NULL)';  // id записи товара из SellTab
      ExecSQL;
      log('Create Table Name: ' + Tables.Items[tBuySellTab]);
    end;

    //Таблица BuyGroupTab
    if TabName in [tAll, tBuyGroupTab] then
    begin
      SQL.Text := 'CREATE TABLE ' + Tables.Items[tBuyGroupTab] + ' (' +
                  'id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
                  'buy_id INTEGER NOT NULL, ' + // id записи товара из BuyTab
                  'group_id INTEGER NOT NULL)'; // id группы товара из GroupsTab
      ExecSQL;
      log('Create Table Name: ' + Tables.Items[tBuyGroupTab]);
    end;

    //Таблица ImagesTab
    if TabName in [tAll, tImagesTab] then
    begin
      SQL.Text := 'CREATE TABLE ' + Tables.Items[tImagesTab] + ' (' +
                  'id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
                  'directory)';  // images dirctoty
      ExecSQL;
      log('Create Table Name: ' + Tables.Items[tImagesTab]);
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
  FDQ.SQL.Text := 'DELETE FROM ' + Tables.Items[tBuyGroupTab] + ' ' +
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

  if FDConnection.Connected then
  begin
    for var TabName in Tables do
      if Not TableExistes(TabName.Value) then
        CreateTables(TabName.Key);

    //FDTGroups.TableName := arTabNameStr[tnGroupsTable];
    //if Not FDTGroups.Active then FDTGroups.Open;

    UpdateMainTable;
    SetControlSelectedGroups;
    SetFieldsDefault(tAll);
    SetFieldsSearch(tBuyTab);

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

  Tables := TDictionary<TTablesName,string>.Create;
  Tables.Add(tBuyTab, 'BuyTab');           // Таблица Купленных товаров
  Tables.Add(tSellTab, 'SellTable');       // Таблица Проданных товаров
  Tables.Add(tGroupsTab, 'GroupsTab');     // Таблица с Группами товаров
  Tables.Add(tBuySellTab, 'BuySellTab');   // Таблица связи покупки и продажи
  Tables.Add(tBuyGroupTab, 'BuyGroupTab'); // Таблица связи Покупок и Групп
  Tables.Add(tImagesTab, 'ImagesTab');     // Таблица в директориями картинок

  BuyFields       := TDictionary<TBuyFieldsType, TFieldRec>.Create;
  BuyFieldsSearch := TDictionary<String, String>.Create;
  GroupsSearch    := TDictionary<String, TGroupRec>.Create;
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
  Tables.Free;
end;

function TFrmMain.GetDirImages: String;
begin
  if FDQBuy.FieldByName('directory').IsNull or
    (FDQBuy.FieldByName('directory').AsString = '') then
    FDirImages := ''
  else
    FDirImages := DBImagesDir + '\' + FDQBuy.FieldByName('directory').AsString;
  Result := FDirImages;
end;

function TFrmMain.GetGroupIDByName(GroupName: String): Integer;
begin
  Result := -1;
  FDQ.SQL.Text := 'SELECT * FROM ' + Tables.Items[tGroupsTab] +
                  ' WHERE group_name = ''' + GroupName + '''';
  FDQ.Open;
  if FDQ.IsEmpty then Exit;
  Result := FDQ.FieldByName('id').AsInteger;
end;

function TFrmMain.GetImageDir(ID: integer): String;
begin
  FDQ.SQL.Text := 'SELECT directory FROM ' + Tables.Items[tImagesTab] +
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
  UpdateMainTable;
end;

procedure TFrmMain.JvDBGBuyCellClick(Column: TColumn);
begin
  if FDQBuy.IsEmpty or (not ChBoxImagesViewer.Checked) then Exit;
  JvImagesViewer.Directory := DirImages;
end;

procedure TFrmMain.JvDBGBuyTitleBtnClick(Sender: TObject; ACol: Integer;
  Field: TField);
begin
  var SortMarker := (Sender as TJvDBGrid).SortMarker;
  case SortMarker of
   smNone:  FDQBuy.IndexName := Field.DisplayName + '_index_asc';
   smDown:  FDQBuy.IndexName := Field.DisplayName + '_index_desc';
   smUp:    FDQBuy.IndexName := Field.DisplayName + '_index_asc';
  end;
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
    or (FDQBuy.FieldByName(BuyFieldsName.id).Value = -1)
  then
    Exit;

  var BF := BuyFieldsName;

   id_msg_result := MessageBox(Handle,
         PChar('Если необходимо переместить файл(ы) в директорию программы то нажмите: ' + #13#10 +
               '"Да" - файлы будут перемещены' + #13#10 +
               '"Нет" - файлы будут скопированы'),
                        PChar(MB_CAPTION),
                        MB_YESNOCANCEL or MB_ICONQUESTION);

   if id_msg_result = ID_CANCEL then Exit;

  if FDQBuy.FieldByName(BF.image_id).IsNull then
  begin
    // Если нет image_id т.е. картинки добавляются в первые
    img_id := NewImageID;
    FDQBuy.Edit;
    FDQBuy.FieldByName(BF.image_id).Value := img_id;
    FDQBuy.Post;
  end
    else
  begin
    // если image_id уже есть
    img_id := FDQBuy.FieldByName(BF.image_id).AsInteger;
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
  if JvImagesViewer.Count = 0 then
    Exit;
  FrmImageViewer.ShowModal;
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
var
  S: String;
  Indx: TFDIndex;
begin
  //FDQBuy.Filter := 'ORDER BY ' + BuyFieldsName.product_name + ' ASC';
  //FDQBuy.Filtered := true;


  mm.Lines.Add(FDQBuy.Indexes.ToString);


  {
  // сперва добавляем индех
  with FDQBuy.Indexes.Add do begin
    Name    := 'By OrderName';
    Fields  := BuyFieldsName.product_name;
    Options := [soDescNullLast];
    Active  := True;
  end;

  // потом вызываем по имени
  FDQBuy.IndexName := 'By OrderName';
  }

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
  FDQ.SQL.Text := 'SELECT * FROM ' +  Tables.Items[tImagesTab];
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

procedure TFrmMain.PMenuImagViewPopup(Sender: TObject);
begin
  if JvImagesViewer.SelectedIndex = -1 then
  begin
    pmivOpenDirSelectImage.Visible := false;
    pmivDeleteImage.Visible        := false;
  end
  else
  begin
    pmivOpenDirSelectImage.Visible := true;
    pmivDeleteImage.Visible        := true;
  end;
  if DirImages = '' then
  begin
    pmivOpenDirImages.Visible   := false;
    pmivDeleteAllImages.Visible := false;
  end
  else
  begin
    pmivOpenDirImages.Visible   := true;
    pmivDeleteAllImages.Visible := true;
  end;
end;

procedure TFrmMain.pmivDeleteAllImagesClick(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Вы действительно желаете удалить все картинки?'),
       PChar(MB_CAPTION), MB_ICONWARNING or MB_YESNO) = ID_NO
  then
    exit;
  for var i: integer := 0 to JvImagesViewer.Count -1 do
    TFile.Delete(JvImagesViewer.Items[i].FileName);
  JvImagesViewer.LoadImages;
end;

procedure TFrmMain.pmivDeleteImageClick(Sender: TObject);
begin
  if MessageBox(
       Handle,
       PChar('Вы действительно желаете удалить выделеную картинку?'),
       PChar(MB_CAPTION), MB_ICONWARNING or MB_YESNO) = ID_NO
  then
    exit;
  TFile.Delete(JvImagesViewer.Items[JvImagesViewer.SelectedIndex].FileName);
  JvImagesViewer.LoadImages;
end;

procedure TFrmMain.pmivOpenDirImagesClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('open'),PChar(FDirImages), Nil, Nil, SW_NORMAL);
end;

procedure TFrmMain.pmivOpenDirSelectImageClick(Sender: TObject);
begin
  var ST := TStringList.Create;
  try
    ST.Add(ExtractFileName(JvImagesViewer.Items[JvImagesViewer.SelectedIndex].FileName));
    ShowFilesOnExplorer(DirImages, ST);
  finally
    ST.Free;
  end;
end;

procedure TFrmMain.PM_CloneRecordClick(Sender: TObject);
Var
  i: SmallInt;
  arFildsSave: array[0..ord(High(TBuyFieldsType))] of string;
  msk: string;
  FieldsSave: TDictionary<string, string>;
begin
  if (FDQBuy.IsEmpty) then Exit;
{
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
    if msk[i+1] = '1' then FDQBuy.Fields[i].AsString := arFildsSave[i]
  end;

 }

  FieldsSave := TDictionary<string, string>.Create;

  try
    for var Fieldpair in BuyFields do
    begin
      if Not (fpClone in Fieldpair.Value.Preset) then
        continue;
      FieldsSave.Add(Fieldpair.Value.Name, FDQBuy.FieldByName(Fieldpair.Value.Name).AsString);
    end;

    FDQBuy.Insert;

    for var Fieldpair in FieldsSave do
      FDQBuy.FieldByName(Fieldpair.Key).AsString := Fieldpair.Value;

  finally
    FieldsSave.Free;
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
  SqlStr, SubStr : String;
  GroupsChecked: Boolean;

begin
  var BF :=  BuyFieldsName;
  var BGF :=  BuyGroupFieldsName;
  var Buy_Image_id      := Tables.Items[tBuyTab] + '.' + BuyFieldsName.image_id;
  var Image_id          := Tables.Items[tImagesTab] + '.' + ImagesFieldsName.id;
  var Buy_id            := Tables.Items[tBuyTab] + '.' + BuyFieldsName.id;
  var BuyGroup_group_id := Tables.Items[tBuyGroupTab] + '.' + BuyGroupFieldsName.group_id;
  var BuyGroup_buy_id   := Tables.Items[tBuyGroupTab] + '.' + BuyGroupFieldsName.buy_id;

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
           SqlStr := 'SELECT DISTINCT' + #13#10 + BuyFieldsList + 'FROM ' + #13#10 +
                     '  ' + Tables.Items[tBuyTab] + ' LEFT OUTER JOIN '+ Tables.Items[tBuyGroupTab] +
                     ' ON ' + BuyGroup_buy_id + ' = ' + Buy_id + #13#10 +
                     '  LEFT OUTER JOIN ' + Tables.Items[tImagesTab] +
                     ' ON ' + Buy_Image_id + ' = ' + Image_id;

           SQL.Add(SqlStr);
           SqlStr := '';
           SQL.Add('WHERE');

           if GroupsChecked then
             SQL.Add('(');
           if JvChCmBoxFieldsSearchBuy.CheckedCount = 0 then
           begin
             for var ItemPair in BuyFieldsSearch do
             begin
               if (ItemPair.Value = BF.date_buy) or (ItemPair.Value = BF.guarant_last_date) then
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
               if (field = BF.date_buy) or (field = BF.guarant_last_date) then
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

             SqlStr := '  ' + BuyGroup_group_id + ' IN ()';
             SubStr := '';
             var comma := '';
             for var FieldPair in GroupsSearch do
             begin
               if FieldPair.Value.checket then
               begin
                 SubStr := SubStr + comma + FieldPair.Value.id.ToString;
                 comma := ', ';
               end;
             end;
             SqlStr := StringReplace(SqlStr, '()', '(' + SubStr + ')', []);
             FDQBuy.SQL.Add(SqlStr);
           end;

           SQL.Add('ORDER BY ' + Buy_id + ' ASC');
           mm.Lines.Add('');
           mm.Lines.Add('procedure TFrmMain.Search: ');         // for debug
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
  BuyGrTab := Tables.Items[tBuyGroupTab];
  GroupTab := Tables.Items[tGroupsTab];
  var BG := BuyGroupFieldsName;
  var G  := GroupsFildsName;

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
  var BF := BuyFieldsName;
  case TabName of

    tBuyTab:
      begin
        FDQ.SQL.Text := 'SELECT DISTINCT ' + BF.shop_name + ' FROM ' + Tables.Items[TabName];
        FDQ.Open;
        if Not FDQ.IsEmpty then
        begin
          DBCmBoxSelectShop.Items.Clear;
          FDQ.First;
          while Not FDQ.Eof do
          begin
            StrValue := FDQ.FieldByName(BF.shop_name).AsString;
            if StrValue <> '' then DBCmBoxSelectShop.Items.Add(StrValue);
            FDQ.Next;
          end;
        end;

        // 5 Срок гарантии
        FDQ.SQL.Text := 'SELECT DISTINCT ' + BF.guarant_period + ' ' +
                        'FROM ' + Tables.Items[TabName] + ' ' +
                        'ORDER BY ' + BF.guarant_period + ' ASC';
        FDQ.Open;
        if Not FDQ.IsEmpty then
        begin
          DBCmBoxGuarantPeriod.Items.Clear;
          FDQ.First;
          while Not FDQ.Eof do
          begin
            StrValue := FDQ.FieldByName(BF.guarant_period).AsString;
            if StrValue <> '' then DBCmBoxGuarantPeriod.Items.Add(StrValue);
            FDQ.Next;
          end;
        end;
      end;

    tSellTab:
      begin
        // in the future will be completed
      end;
  end;
end;

procedure TFrmMain.SetFieldsSearch(TabName: TTablesName);
var
   i: ShortInt;
   Field: TBuyFieldsType;
   FieldName, FieldCap: string;
begin

  JvChCmBoxFieldsSearchBuy.Clear;
  JvChCmBoxFieldsSearchSell.Clear;

  // Перечисляю и заполняю по Типам , что бы сохранить уникальный порядок списка
  for i := 0 to Ord(High(TBuyFieldsType)) do
  begin
    //field := arBuyTabFieldsName[i];
    Field := TBuyFieldsType(i);
    if fpSearch in BuyFields.items[Field].preset then
    begin
      FieldName := BuyFields.items[field].Name;
      FieldCap  := BuyFields.items[Field].Caption;
      BuyFieldsSearch.Add(FieldCap, FieldName);
      JvChCmBoxFieldsSearchBuy.Items.Add(FieldCap);
    end;
  end;

  // необходимо пербрать в цикле повторно и проставить checked
  // т.к. в цикле при запонении JvChCmBoxFieldsSearchBuy checked не проставляются видимо Bug
  for i := 0 to Ord(High(TBuyFieldsType)) do
  begin
    if fpChecket in BuyFields.items[TBuyFieldsType(i)].preset then
    begin
      FieldCap :=BuyFields.items[TBuyFieldsType(i)].Caption;
      var x := JvChCmBoxFieldsSearchBuy.Items.IndexOf( FieldCap);
      if x <> -1 then JvChCmBoxFieldsSearchBuy.Checked[x] := true;
    end;
  end;

     // for i := 1 to High(arBuyTabFieldsCaption) do
     //              JvChCmBoxFieldsSearch.Items.Add(arBuyTabFieldsCaption[i]);

  for i := 1 to High(arSellFieldsCaption) do
    JvChCmBoxFieldsSearchSell.Items.Add(arSellFieldsCaption[i]);


  //if JvChCmBoxFieldsSearch.Items.Count <> 0 then
  //  JvChCmBoxFieldsSearch.Checked[1] := true;

end;

procedure TFrmMain.SetFieldsDefault(TabName: TTablesName);
var
  i: ShortInt;
begin
  if TabName in [tAll, tBuyTab] then
  begin
    for i := 0 to ord(High(TBuyFieldsType)) do
    begin
      var bf := TBuyFieldsType(i);
      with JvDBGBuy.Columns.Add do
      begin
        FieldName        := BuyFields.Items[bf].Name;
        Title.Caption    := BuyFields.Items[bf].Caption;
        Title.Alignment  := BuyFields.Items[bf].DefAlignment;
        Title.Font.Style := [fsBold];
        //Title.Font.Size  := 10;
        Alignment        := BuyFields.Items[bf].DefAlignment;
        Width            := BuyFields.Items[bf].DefWidth;
        if i = 0 then Visible := false else Visible := true;
      end;

      // Create sorted inedex
      with FDQBuy.Indexes.Add do
      begin
        Name    := BuyFields.Items[bf].Name + '_index_asc';
        Fields  := BuyFields.Items[bf].Name;
        Active  := True;
      end;
      mm.Lines.Add(BuyFields.Items[bf].Name + '_index_asc');

      with FDQBuy.Indexes.Add do
      begin
        Name    := BuyFields.Items[bf].Name + '_index_desc';
        Fields  := BuyFields.Items[bf].Name;
        Options := [soDescending];
        Active  := True;
      end;
      mm.Lines.Add(BuyFields.Items[bf].Name + '_index_desc');

    end;
  end;

  if TabName in [tAll, tSellTab] then
  begin
    for i := 0 to High(arSellFields) do
    begin
      with JvDBGSell.Columns.Add do
      begin
        FieldName        := arSellFields[i];
        Title.Caption    := arSellFieldsCaption[i];
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

procedure TFrmMain.SetSortIndexes;
begin
  //
end;

procedure TFrmMain.SetControlSelectedGroups;
begin
  FDQ.SQL.Text :=  'SELECT * FROM ' + Tables.Items[tGroupsTab];
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
  ADD_OR: String;
  GroupsChecked: Boolean;
  SubStr: String;
begin
  //var GroupsTab         := Tables.Items[tGroupsTab];
  var Buy_Image_id      := Tables.Items[tBuyTab] + '.' + BuyFieldsName.image_id;
  var Image_id          := Tables.Items[tImagesTab] + '.' + ImagesFieldsName.id;
  var Buy_id            := Tables.Items[tBuyTab] + '.' + BuyFieldsName.id;
  var BuyGroup_group_id := Tables.Items[tBuyGroupTab] + '.' + BuyGroupFieldsName.group_id;
  var BuyGroup_buy_id   := Tables.Items[tBuyGroupTab] + '.' + BuyGroupFieldsName.buy_id;
  //GroupsChecked

  FDQBuy.SQL.Clear;
  GroupsChecked := false;

  SqlStr := 'SELECT DISTINCT' +#13#10 + BuyFieldsList + 'FROM ' + #13#10 +
            '  ' + Tables.Items[tBuyTab] + ' LEFT OUTER JOIN '+ Tables.Items[tBuyGroupTab] +
            ' ON ' + BuyGroup_buy_id + ' = ' + Buy_id + #13#10 +
            '  LEFT OUTER JOIN ' + Tables.Items[tImagesTab] +
            ' ON ' + Buy_Image_id + ' = ' + Image_id;

  FDQBuy.SQL.Add(SqlStr);

  if JvChCmBoxViewSelectedGroups.CheckedCount > 0 then
  begin
    FDQBuy.SQL.Add('WHERE');
    SqlStr := '   ' + BuyGroup_group_id + ' IN ()';
    SubStr := '';
    var comma := '';
    for var FieldPair in GroupsSearch do
    begin
      if FieldPair.Value.checket then
      begin
        SubStr := SubStr + comma + FieldPair.Value.id.ToString;
        comma := ', ';
      end;
    end;
    SqlStr := StringReplace(SqlStr, '()', '(' + SubStr + ')', []);
    FDQBuy.SQL.Add(SqlStr);
  end;

  FDQBuy.SQL.Add('ORDER BY ' + Buy_id + ' ASC');

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

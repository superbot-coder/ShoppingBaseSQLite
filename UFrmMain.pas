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
  Vcl.Buttons;

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
    CmBoxVclStyle: TComboBox;
    FDConnection: TFDConnection;
    FDQ: TFDQuery;
    FDQBuy: TFDQuery;
    DSBuy: TDataSource;
    Button1: TButton;
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
    dbeGuaranteePeriod: TDBEdit;
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
    procedure FormCreate(Sender: TObject);
    procedure CmBoxVclStyleSelect(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnSearchCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpBtnBuyTabColAutoSizeClick(Sender: TObject);
    procedure SpBtnBuyTabColSaveClick(Sender: TObject);
    procedure FDQBeforeDelete(DataSet: TDataSet);
    procedure SpBtnSellTabColSaveClick(Sender: TObject);
    procedure SpBtnSellTabColAutoSizeClick(Sender: TObject);
    procedure ChBoxBuyTabEditModeClick(Sender: TObject);
    procedure ChBoxSellTabEditModeClick(Sender: TObject);
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
  FileBuyTabColSettings : String;
  FileSellTabColSettings: String;

  arTabNameStr: array[TTablesName] of string =
    ('AllTab', 'BuyTab', 'SellTab', 'GroupsTab', 'BuySellTab', 'BuyGroupTab');

  arBuyTabFieldsName: array[0..10] of string = (
    'id',                // ID
    'date_buy',          // Дата покупки
    'product_name',      // Название товара
    'count',             // Количество
    'buy_price',         // Цена
    'guarant_period',    // Срок гарантии
    'guarant_last_date', // Дата истечения гарантии
    'shop_name',         // Название магазина
    'product_id',        // Код товара в магазине
    'seller_phone',      // Телефон продавца
    'seller_name');      // Имя продавца

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
    'Имя продавца');

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
     150); // 10 Имя продавца;

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
     taLeftJustify,  // 9 Телефон продавца
     taLeftJustify); // 10 Имя продавца;

  arSellTabFieldsName: array[0..6] of string = (
    'id',           // ID
    'date_sell',    // Дата продажи
    'product_name', // Название товара
    'count',        // Количество
    'sell_price',   // Цена продажи
    'buyer_phone',  // Телефон покупателя
    'bayer_name');  // Имя покупателя

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


implementation

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
begin

  case PageControl.ActivePageIndex of
    0: begin
         with FDQBuy do
         begin
           Close;
           SQL.Text := 'SELECT * FROM ' + arTabNameStr[tnBuyTable] + ' ' +
             'WHERE (' + arBuyTabFieldsName[1] + ' LIKE :p1) ' + // 1 Дата покупки
                'OR (' + arBuyTabFieldsName[2] + ' LIKE :p2) ' + // 2 Название товара
                'OR (' + arBuyTabFieldsName[3] + ' LIKE :p3) ' + // 3 Количество
                'OR (' + arBuyTabFieldsName[4] + ' LIKE :p4) ' + // 4 Цена
                'OR (' + arBuyTabFieldsName[5] + ' LIKE :p5) ' + // 5 Срок гарантии
                'OR (' + arBuyTabFieldsName[6] + ' LIKE :p6) ' + // 6 Дата истечения гарантии
                'OR (' + arBuyTabFieldsName[7] + ' LIKE :p7) ' + // 7 Название магазина
                'OR (' + arBuyTabFieldsName[8] + ' LIKE :p8) ' + // 8 Код товара в магазине
                'OR (' + arBuyTabFieldsName[9] + ' LIKE :p9) ' + // 9 Телефон продавца
                'OR (' + arBuyTabFieldsName[10] + ' LIKE :p10) ' + // 10 Имя продавца
                'ORDER BY product_name ASC';
           Params.FindParam('p1').Value := '%'+lblEdSearch.Text+'%';
           Params.FindParam('p2').Value := '%'+lblEdSearch.Text+'%';
           Params.FindParam('p3').Value := '%'+lblEdSearch.Text+'%';
           Params.FindParam('p4').Value := '%'+lblEdSearch.Text+'%';
           Params.FindParam('p5').Value := '%'+lblEdSearch.Text+'%';
           Params.FindParam('p6').Value := '%'+lblEdSearch.Text+'%';
           Params.FindParam('p7').Value := '%'+lblEdSearch.Text+'%';
           Params.FindParam('p8').Value := '%'+lblEdSearch.Text+'%';
           Params.FindParam('p9').Value := '%'+lblEdSearch.Text+'%';
           Params.FindParam('p10').Value := '%'+lblEdSearch.Text+'%';
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

procedure TFrmMain.Button1Click(Sender: TObject);
var
  i: integer;
begin

  SaveColumnsSettings;

 {
  ADOQuery.SQL.Text := 'SELECT * FROM shopping_data';
  ADOQuery.Open;
  ADOQuery.Sort := 'Date_to_buy ASC';

  With ADOQuery do
  begin
    First;
    FDQMain.First;
    while Not Eof do
    begin
      FDQMain.Insert;
      FDQMain.FieldByName('date_buy').Value        := FieldByName('Date_to_buy').Value;
      FDQMain.FieldByName('product_name').AsString := FieldByName('Product_name').AsString;
      FDQMain.FieldByName('count').AsInteger       := ADOQuery.FieldByName('Count').AsInteger;
      FDQMain.FieldByName('buy_price').AsInteger   := FieldByName('Cost').AsInteger;
      FDQMain.FieldByName('shop_name').AsString    := FieldByName('Shop_Name').AsString;
      FDQMain.Post;
      Next;
    end;
  end;

  UpdateMainTable;
  }
end;

procedure TFrmMain.ChBoxBuyTabEditModeClick(Sender: TObject);
begin
  if ChBoxBuyTabEditMode.Checked then
  begin
    DBNavigatorBuyTab.Enabled := true;
    PanelEditBuy.Visible      := true;
  end
    else
  begin
   DBNavigatorBuyTab.Enabled := false;
   PanelEditBuy.Visible      := false;
  end;
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

procedure TFrmMain.CmBoxVclStyleSelect(Sender: TObject);
begin
  TStyleManager.SetStyle(CmBoxVclStyle.Text);
end;

procedure TFrmMain.CreateTables(TabName: TTablesName);
begin
  with FDQ do
  begin
    // Таблица BuyTable
    if TabName in [tnAll, tnBuyTable] then
    begin
      SQL.Text := 'CREATE TABLE ' + arTabNameStr[tnBuyTable] + ' (' +
        arBuyTabFieldsName[0] + 'INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1, ' +
        arBuyTabFieldsName[1] + ' DATE NOT NULL, '     + // Дата покупки
        arBuyTabFieldsName[2] + ' VARCHAR NOT NULL,'   + // Название товара
        arBuyTabFieldsName[3] + ' INTEGER NOT NULL, '  + // Количество
        arBuyTabFieldsName[4] + ' CURRENCY NOT NULL, ' + // Цена
        arBuyTabFieldsName[5] + ' INTEGER, '           + // Срок гарантии
        arBuyTabFieldsName[6] + ' DATE, '              + // Дата истечения гарантии
        arBuyTabFieldsName[7] + ' VARCHAR, '           + // Название магазина
        arBuyTabFieldsName[8] + ' VARCHAR, '           + // Код товара в магазине
        arBuyTabFieldsName[9] + ' VARCHAR, '           + // Телефон продавца
        arBuyTabFieldsName[10] + ' VARCHAR)';            // Имя продавца
      ExecSQL;
      log('Create Table Name: ' + arTabNameStr[tnBuyTable]);
    end;

    // Таблица SellTable
    if TabName in [tnAll, tnSellTable] then
    begin
      SQL.Text := 'CREATE TABLE ' + arTabNameStr[tnSellTable] + ' (' +
        arSellTabFieldsName[0] + ' INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
        arSellTabFieldsName[0] + ' DATA, '              + // Дата продажи
        arSellTabFieldsName[0] + ' VARCHAR,'            + // Название товара
        arSellTabFieldsName[0] + ' INTEGER, '           + // Количество
        arSellTabFieldsName[0] + ' CURRENCY NOT NULL, ' + // Цена продажи
        arSellTabFieldsName[0] + ' VARCHAR, '           + // Телефон покупателя
        arSellTabFieldsName[0] + ' VARCHAR)';             // Имя покупателя
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

procedure TFrmMain.FDQBeforeDelete(DataSet: TDataSet);
begin
  if MessageBox(Handle,
    PChar('Вы действительно желаете удалить запись?'),
     PChar(''), MB_ICONWARNING or MB_YESNO) = ID_NO then Abort;
end;

procedure TFrmMain.FormActivate(Sender: TObject);
var
  i: SmallInt;
begin

  if FDConnection.Connected then
  begin
    for i := 0 to length(arTabNameStr) -1 do
    begin
      if i = 0 then Continue;
      if Not TableExistes(arTabNameStr[TTablesName(i)]) then
        CreateTables(TTablesName(i));
    end;
    UpdateMainTable;
    SetFieldsDefault(tnAll);

    if FileExists(FileBuyTabColSettings) then
      JvDBGBuy.Columns.LoadFromFile(FileBuyTabColSettings);
    if FileExists(FileSellTabColSettings)  then
      // JvDBGSell.Columns.LoadFromFile(FileSellTabColSettings);

    UpdateStatusBar;
  end;

  //ShowMessage(IntToStr(JvDBG.FieldCount));
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  CurrDir := ExtractFileDir(Application.ExeName);
  for StyleName in TStyleManager.StyleNames do CmBoxVclStyle.Items.Add(StyleName);

  CmBoxVclStyle.ItemIndex := CmBoxVclStyle.Items.IndexOf('Sapphire Kamri');
  if CmBoxVclStyle.Text <> '' then TStyleManager.SetStyle(CmBoxVclStyle.Text);

  FSTLog := TStringList.Create;

  DBSaveDir := GetEnvironmentVariable('USERPROFILE') + '\Documents\ShoppingBaseSave';
  DBFile    := DBSaveDir + '\ShoppingBase.db3';
  FileBuyTabColSettings  := DBSaveDir + '\BuyTabColumnsSettings.data';
  FileSellTabColSettings := DBSaveDir + '\SellTabColumnsSettings.data';

  if Not DirectoryExists(DBSaveDir) then ForceDirectories(DBSaveDir);
  FDConnection.Params.Database := DBFile;
  FDConnection.Open;
  //JvDBG.Align := alTop;
  //mm.Align    := alBottom;

  PanelEditBuy.Align := alTop;
  PanelSearch.Align  := alTop;
  //AddShops;
  //BtnSearchCloseClick(Nil);

end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  FSTLog.Free;
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

procedure TFrmMain.SetFieldsDefault(TabName: TTablesName);
var
  i: ShortInt;
begin
  if TabName in [tnAll, tnBuyTable] then
  begin
    for i := 0 to High(arBuyTabFieldsName)-1 do
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
    for i := 0 to Length(arSellTabFieldsName) -1 do
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

procedure TFrmMain.SpBtnBuyTabColAutoSizeClick(Sender: TObject);
begin
  JvDBGBuy.AutoSizeColumns := true;
  JvDBGBuy.AutoSizeColumns := false;
end;

procedure TFrmMain.SpBtnBuyTabColSaveClick(Sender: TObject);
begin
  JvDBGBuy.Columns.SaveToFile(FileBuyTabColSettings);
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
  FDQ.SQL.text := 'SELECT * FROM sqlite_master WHERE Name = :p1';
  FDQ.Params[0].Value := TableName;
  FDQ.Open;
  Result := Not FDQ.IsEmpty;
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

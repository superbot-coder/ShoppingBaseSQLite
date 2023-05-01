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
  JvDatePickerEdit, JvDBDatePickerEdit;

type TSortType = (stASC, stDESC);
type TTablesName = (tnAll, tnBuyTable, tnSellTable, tnGroupsTable,
                    tnBuySellTable, tnBuyGroupTable);

type
  TFrmMain = class(TForm)
    OpenDialog: TOpenDialog;
    PanelEdit: TPanel;
    dbeProductName: TDBEdit;
    dbeCount: TDBEdit;
    dbeBuyPrice: TDBEdit;
    dbeGuaranteePeriod: TDBEdit;
    DBCmBoxSelectShop: TDBComboBox;
    DBNavigator: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    StatusBar: TStatusBar;
    PanelSearch: TPanel;
    lblEdSearch: TLabeledEdit;
    BtnSearch: TButton;
    ChBoxEditEnable: TCheckBox;
    BtnSearchClose: TButton;
    CmBoxVclStyle: TComboBox;
    FDConnection: TFDConnection;
    FDQ: TFDQuery;
    FDQMain: TFDQuery;
    JvDBG: TJvDBGrid;
    DSMain: TDataSource;
    Button1: TButton;
    mm: TMemo;
    Button2: TButton;
    dbeSellerPhone: TDBEdit;
    lblSellerPhone: TLabel;
    dbeSellerName: TDBEdit;
    dbeProductId: TDBEdit;
    LblSellerName: TLabel;
    lblProductId: TLabel;
    jvdpeGuaranteeLastDate: TJvDBDatePickerEdit;
    JvdpeDateBuy: TJvDBDatePickerEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmBoxVclStyleSelect(Sender: TObject);
    procedure ChBoxEditEnableClick(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnSearchCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FSTLog: TStrings;
    FFieldLastSorted: string;
    FSortingDirection: TSortType;
    procedure UpdateStatusBar;
    Procedure AddShops;
    procedure CreateTables(TabName: TTablesName);
    procedure log(StrValue: String);
    function TableExistes(TableName: String): boolean;
    procedure SetFieldsDefault;
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
  BuyTabFileColSettings : String;
  SellTabFileColSettings: String;

  arTabNameStr: array[TTablesName] of string =
    ('AllTab', 'BuyTab', 'SellTab', 'GroupsTab', 'BuySellTab', 'BuyGroupTab');

  arBuyTabFields: array[0..10] of string = (
     'id', 'Дата покупки', 'Название товара', 'Количество', 'Цена',
     'Срок гарантии', 'Дата истечения гарантии', 'Магазин',
     'Код товара в магазине', 'Телефон продавца','Имя продавца');


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
begin
{
  with ADOQuery do
  begin
    Close;
    SQL.Text := 'SELECT * FROM shopping_data ' +
      'WHERE (Date_to_buy LIKE :p1) ' +
      'OR (Product_Name LIKE :p2) ' +
      'OR (Count LIKE :p3) ' +
      'OR (Cost LIKE :p4) ' +
      'OR (Guarantee LIKE :p5) ' +
      'OR (Data_Guarantee LIKE :p6) ' +
      'OR (Shop_Name LIKE :p7)';
    Parameters.FindParam('p1').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p2').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p3').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p4').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p5').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p6').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p7').Value := '%'+lblEdSearch.Text+'%';
    Open;
    Sort := 'Product_Name ASC'
  end;
  }
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

procedure TFrmMain.Button2Click(Sender: TObject);
begin
 //
end;

procedure TFrmMain.ChBoxEditEnableClick(Sender: TObject);
begin
  if ChBoxEditEnable.Checked then
  begin
    DBNavigator.Enabled := true;
    PanelEdit.Visible   := true;
  end
    else
  begin
   DBNavigator.Enabled := false;
   PanelEdit.Visible   := false;
   UpdateStatusBar;
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
                  'id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1, '+
                  'date_buy DATE NOT NULL, '       + // Дата покупки
                  'product_name VARCHAR NOT NULL,' + // Название товара
                  'count INTEGER NOT NULL, '       + // Количество
                  'buy_price CURRENCY NOT NULL, '  + // Цена
                  'guarantee_period INTEGER, '     + // Срок гарантии
                  'guarantee_last_date DATE, '     + // Дата истечения гарантии
                  'shop_name VARCHAR, '            + // Название магазина
                  'product_id INTEGER, '           + // Код товара в магазине
                  'seller_phone VARCHAR, '         + // Телефон продавца
                  'seller_name VARCHAR)';            // Имя продавца
      ExecSQL;
      log('Create Table Name: ' + arTabNameStr[tnBuyTable]);
    end;

    // Таблица SellTable
    if TabName in [tnAll, tnSellTable] then
    begin
      SQL.Text := 'CREATE TABLE ' + arTabNameStr[tnSellTable] + ' (' +
                  'id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL DEFAULT 1,' +
                  'date_sell DATA, '               + // Дата продажи
                  'product_name VARCHAR,'          + // Название товара
                  'count INTEGER, '                + // Количество
                  'sell_price CURRENCY NOT NULL, ' + // Цена продажи
                  'buyer_phone VARCHAR, '         + // Телефон покупателя
                  'bayer_name VARCHAR)';             // Имя покупателя

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
    SetFieldsDefault;

    if FileExists(BuyTabFileColSettings) then
      JvDBG.Columns.LoadFromFile(BuyTabFileColSettings);

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
  BuyTabFileColSettings  := DBSaveDir + '\BuyTabColumnsSettings.data';
  SellTabFileColSettings := DBSaveDir + '\SellTabColumnsSettings.data';

  if Not DirectoryExists(DBSaveDir) then ForceDirectories(DBSaveDir);
  FDConnection.Params.Database := DBFile;
  FDConnection.Open;
  //JvDBG.Align := alTop;
  //mm.Align    := alBottom;

  PanelEdit.Align   := alTop;
  PanelSearch.Align := alTop;
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
    STInp.LoadFromFile(BuyTabFileColSettings + '_');
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


  RootArray := TJSONObject.ParseJSONValue(TFile.ReadAllBytes(BuyTabFileColSettings + '_'), 0) as TJSONArray;
  jtxt := TFile.ReadAllText(BuyTabFileColSettings+'_', TEncoding.UTF8);

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

    for i := 0 to JvDBG.Columns.Count -1 do
    begin
      ColObj    := TJSONObject.Create;
      ColObj.AddPair('title_caption', JvDBG.Columns.Items[i].Title.Caption)
            .AddPair('field_name', JvDBG.Columns.Items[i].FieldName)
            .AddPair('title_alignment', TJSONNumber.Create(ord(JvDBG.Columns.Items[i].Title.Alignment)))
            .AddPair('alignment', TJSONNumber.Create(ord(JvDBG.Columns.Items[i].Alignment)))
            .AddPair('width', TJSONNumber.Create(JvDBG.Columns.Items[i].Width))
            .AddPair('visible', TJSONBool.Create(JvDBG.Columns.Items[i].visible));
      arColumns.Add(ColObj);
    end;

    TabColObj := TJSONObject.Create;
    TabColObj.AddPair('table_name', 'BuyTab');
    TabColObj.AddPair('columns', arColumns as TJSONValue);
    RootArray.Add(TabColObj);

    // TFile.WriteAllText(FileColSettings, RootArray.ToJSON);
    TFile.WriteAllText(BuyTabFileColSettings + '_', TJSON.Format(RootArray));

  finally
    RootArray.Free;
  end;
end;

procedure TFrmMain.SetFieldsDefault;
var
  col: TColumn;
  i: ShortInt;
begin

  col := JvDBG.Columns.Add;
  col.FieldName        := 'id';
  col.Title.Caption    := 'ID';
  col.Width            := 50;
  col.Visible          := false;

  col := JvDBG.Columns.Add;
  col.FieldName        := 'date_buy';
  col.Title.Caption    := arBuyTabFields[1];
  col.Title.Alignment  := taCenter;
  col.Alignment        := taCenter;
  col.Width            := 100;
  col.Visible          := true;

  col := JvDBG.Columns.Add;
  col.FieldName        := 'product_name';
  col.Title.Caption    := arBuyTabFields[2];
  //col.Title.Alignment  := taCenter;
  //col.Alignment        := taCenter;
  col.Width            := 300;
  col.Visible          := true;

  col := JvDBG.Columns.Add;
  col.FieldName        := 'count';
  col.Title.Caption    := arBuyTabFields[3];
  col.Title.Alignment  := taCenter;
  col.Alignment        := taCenter;
  col.Width            := 50;
  col.Visible          := true;

  col := JvDBG.Columns.Add;
  col.FieldName        := 'buy_price';
  col.Title.Caption    := arBuyTabFields[4];
  col.Title.Alignment  := taCenter;
  col.Alignment        := taCenter;
  col.Width            := 100;
  col.Visible          := true;

  col := JvDBG.Columns.Add;
  col.FieldName        := 'guarantee_period';
  col.Title.Caption    := arBuyTabFields[5];
  col.Title.Alignment  := taCenter;
  col.Alignment        := taCenter;
  col.Width            := 50;
  col.Visible          := false;

  col := JvDBG.Columns.Add;
  col.FieldName        := 'guarantee_last_date';
  col.Title.Caption    := arBuyTabFields[6];
  col.Title.Alignment  := taCenter;
  col.Alignment        := taCenter;
  col.Width            := 100;
  col.Visible          := false;

  col := JvDBG.Columns.Add;
  col.FieldName        := 'shop_name';
  col.Title.Caption    := arBuyTabFields[7];
  col.Title.Alignment  := taCenter;
  col.Alignment        := taCenter;
  col.Width            := 100;
  col.Visible          := true;

  col := JvDBG.Columns.Add;
  col.FieldName        := 'product_id';
  col.Title.Caption    := arBuyTabFields[8];
  col.Title.Alignment  := taCenter;
  col.Alignment        := taCenter;
  col.Width            := 50;
  col.Visible          := false;

  col := JvDBG.Columns.Add;
  col.FieldName        := 'seller_phone';
  col.Title.Caption    := arBuyTabFields[9];
  col.Title.Alignment  := taCenter;
  col.Alignment        := taCenter;
  col.Width            := 150;
  col.Visible          := true;

  col := JvDBG.Columns.Add;
  col.FieldName        := 'seller_name';
  col.Title.Caption    := arBuyTabFields[10];
  //col.Title.Alignment  := taCenter;
  //col.Alignment        := taCenter;
  col.Width            := 150;
  col.Visible          := true;

  for i := 0 to JvDBG.Columns.Count-1 do
  begin
    JvDBG.Columns.Items[i].Title.Font.Style := [fsBold];
    JvDBG.Columns.Items[i].Title.Font.Size  := 10;
  end;

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
  FDQMain.SQL.Text := 'SELECT * FROM BuyTab';
  FDQMain.Open;
end;

procedure TFrmMain.UpdateStatusBar;
var
  i: Integer;
begin
  JvDBG.BeginUpdate;
  i := 0;
  FDQMain.First;
  while FDQMain.Eof = false do
  begin
    i := i + FDQMain.FieldByName('buy_price').AsInteger;
    FDQMain.Next;
  end;
  FDQMain.First;
  JvDBG.EndUpdate;

  StatusBar.Panels[0].Text := 'Записей: ' + IntToStr(FDQMain.RecordCount);
  StatusBar.Panels[1].Text := 'Сумма: ' + IntToStr(i);
end;

end.

unit DBTypes;

interface

USES
  System.Classes;

type TSortType = (stASC, stDESC);
//type TTablesName = (tnAll, tnBuyTable, tnSellTable, tnGroupsTable,
//                    tnBuySellTable, tnBuyGroupTable, tnImagesTable);

type
  TTablesName = (
    tAll,         // ���������� ������ �������� ���� ������
    tBuyTab,      // ������� �������
    tSellTab,     // ������� ������
    tGroupsTab,   // ������� ������
    tBuySellTab,  // ������� ����� (�����-�������) ������� � ������
    tBuyGroupTab, // ������� ����� (�����-�������) ������� � �����
    tImagesTab);  // ������� � ������������ ��������

type
  TBuyFieldsNameRec = record
    id:                 string; // 0 ID
    date_buy:           string; // 1 ���� �������
    product_name:       string; // 2 �������� ������
    count:              string; // 3 ����������
    buy_price:          string; // 4 ����
    guarant_period:     string; // 5 ���� ��������
    guarant_last_date:  string; // 6 ���� ��������� ��������
    shop_name:          string; // 7 �������� ��������
    product_id:         string; // 8 ��� ������ � ��������
    seller_phone:       string; // 9 ������� ��������
    seller_name:        string; // 10 ��� ��������
    web_page:           string; // 11 ��� ��������
    image_id:           string; // 12 id ���������� ��������
    item_state:         string; // 13 ��������� ����
  end;

type
  TSellFieldsNameRec = record
    id           : string; // 0 ID
    date_sell    : string; // 1 ���� �������
    product_name : string; // 2 �������� ������
    count        : string; // 3 ����������
    sell_price   : string; // 4 ���� �������
    buyer_phone  : string; // 5 ������� ����������
    bayer_name   : string; // 6 ��� ����������
  end;

type
  TGroupsFildsNameRec = record
    id         : string; // �� ������
    group_name : string; // �������� ������
  end;

type
  TBuySellFieldsNameRec = record
    id      : string;
    buy_id  : string;
    sell_id : string;
  end;

type
  TBuyGroupFieldsNameRec = record
    id       : string;
    buy_id   : string;
    group_id : string;
  end;

type
  TImagesFieldsNameRec = record
    id        : string;
    directory : string;
  end;

type
  TBuyFieldsType = (
    bf_id,                // 0 ID
    bf_date_buy,          // 1 ���� �������
    bf_product_name,      // 2 �������� ������
    bf_count,             // 3 ����������
    bf_buy_price,         // 4 ����
    bf_guarant_period,    // 5 ���� ��������
    bf_guarant_last_date, // 6 ���� ��������� ��������
    bf_shop_name,         // 7 �������� ��������
    bf_product_id,        // 8 ��� ������ � ��������
    bf_seller_phone,      // 9 ������� ��������
    bf_seller_name,       // 10 ��� ��������
    bf_web_page,          // 11 ��� ��������
    bf_image_id,          // 12 id ���������� ��������
    bf_item_state);       // 13 ��������� ����

type
  TSellFieldsType = (
    sf_id,           // 0 ID
    sf_date_sell,    // 1 ���� �������
    sf_product_name, // 2 �������� ������
    sf_count,        // 3 ����������
    sf_sell_price,   // 4 ���� �������
    sf_buyer_phone,  // 5 ������� ����������
    sf_bayer_name);  // 6 ��� ����������

type
  TFieldsPerest = (
    fpCreate,   // ���� ��������� � DBGrid, ���� ����� ��������� ���, �� ���� �� ����� ������� � DBGrid
    fpVisible,  // �� �������� ������������ DBGrid ��� �� ������
    fpSearch,   // ���� ����� ��������� � ���������� ������ jvCheckedComboBox ��� ������
    fpChecket,  // ����������� �������� � jvCheckedComboBox ��� ������ (�������� �������)
    fpClone);   // ���� � ����� ������ ����� ������������� � ����� ������

type
  TFieldRec = record
    Name          : String;
    Caption       : String;
    DefWidth     : Word;
    DefAlignment : TAlignment;
    Preset        : Set of TFieldsPerest;
  end;

type
  TGroupRec = record
    id: integer;
    checket: Boolean;
  end;

var
  arFileMask: array[0..17] of string = (
      '.wbmp','.webp','.svg','.gif','.cur','.pcx','.ani','.png','.gif','.jpg',
      '.jpeg', '.png', '.bmp', '.ico', '.emf', '.wmf', '.tif', '.tiff');

  // arTabNameStr: array[TTablesName] of string =
  //  ('AllTab', 'BuyTab', 'SellTab', 'GroupsTab', 'BuySellTab', 'BuyGroupTab', 'ImagesTab');
{
  arBuyTabFieldsName: array[0..13] of string = (
    'id',                // 0 ID
    'date_buy',          // 1 ���� �������
    'product_name',      // 2 �������� ������
    'count',             // 3 ����������
    'buy_price',         // 4 ����
    'guarant_period',    // 5 ���� ��������
    'guarant_last_date', // 6 ���� ��������� ��������
    'shop_name',         // 7 �������� ��������
    'product_id',        // 8 ��� ������ � ��������
    'seller_phone',      // 9 ������� ��������
    'seller_name',       // 10 ��� ��������
    'web_page',          // 11 ��� ��������
    'image_id',          // 12 id ���������� ��������
    'item_state');       // 13 ��������� ����

  arBuyTabFieldsCaption: array[0..High(arBuyTabFieldsName)] of string = (
    'ID',
    '���� �������',
    '�������� ������',
    '����������',
    '����',
    '���� ��������',
    '���� ��������� ��������',
    '�������',
    '��� ������ � ��������',
    '������� ��������',
    '��� ��������',
    '��� ��������',
    'ID ��������',
    '���������');

  arBuyFieldsWidth: array[0..High(arBuyTabFieldsName)] of Word = (
     50,   // 0 ID
     100,  // 1 ���� �������
     300,  // 2 �������� ������
     50,   // 3 ����������
     100,  // 4 ����
     50,   // 5 ���� ��������
     100,  // 6 ���� ��������� ��������
     100,  // 7 �������� ��������
     50,   // 8 ��� ������ � ��������
     150,  // 9 ������� ��������
     150,  // 10 ��� ��������;
     150,  // 11 ��� ��������
     50,   // 12 id ���������� ��������
     150); // 13 ��������� ����

  arBuyFieldsAlignment: array[0.. High(arBuyTabFieldsName)] of TAlignment = (
     taCenter,       // 0 ID
     taCenter,       // 1 ���� �������
     taLeftJustify,  // 2 �������� ������
     taCenter,       // 3 ����������
     taCenter,       // 4 ����
     taCenter,       // 5 ���� ��������
     taCenter,       // 6 ���� ��������� ��������
     taCenter,       // 7 �������� ��������
     taCenter,       // 8 ��� ������ � ��������
     taCenter,       // 9 ������� ��������
     taLeftJustify,  // 10 ��� ��������;
     taLeftJustify,  // 11 ��� ��������
     taCenter,       // 12 id ���������� ��������
     taCenter);      // 13 ��������� ����
   }
  arSellFields: array[0..6] of string = (
    'id',           // 0 ID
    'date_sell',    // 1 ���� �������
    'product_name', // 2 �������� ������
    'count',        // 3 ����������
    'sell_price',   // 4 ���� �������
    'buyer_phone',  // 5 ������� ����������
    'bayer_name');  // 6 ��� ����������

  arSellFieldsCaption: array[0..High(arSellFields)] of string = (
    'ID',
    '���� �������',
    '�������� ������',
    '����������',
    '���� �������',
    '������� ����������',
    '��� ����������');

  arSellFieldsWidth: array[0..High(arSellFields)] of Word = (
     50,    // 0 ID
     100,   // 1 ���� �������
     300,   // 2 �������� ������
     50,    // 3 ����������
     100,   // 4 ���� �������
     150,   // 5 ������� ����������
     150);  // 6 ��� ����������

  arSellFieldsAlignment: array[0.. High(arSellFields)] of TAlignment = (
     taCenter,       // 0 ID
     taCenter,       // 1 ���� �������
     taLeftJustify,  // 2 �������� ������
     taCenter,       // 3 ����������
     taCenter,       // 4 ���� �������
     taLeftJustify,  // 5 ������� ����������
     taLeftJustify); // 6 ��� ����������

  BuyFieldsName      : TBuyFieldsNameRec;
  SellFieldsName     : TSellFieldsNameRec;
  GroupsFildsName    : TGroupsFildsNameRec;
  BuySellFieldsName  : TBuySellFieldsNameRec;
  BuyGroupFieldsName : TBuyGroupFieldsNameRec;
  ImagesFieldsName   : TImagesFieldsNameRec;

const

    (*
    + id,                                   // 0 ID
    | + date_buy                            // 1 ���� �������
    | | + product_name                      // 2 �������� ������
    | | | + count                           // 3 ����������
    | | | | + buy_price                     // 4 ����
    | | | | | + guarant_period              // 5 ���� ��������
    | | | | | | + guarant_last_date         // 6 ���� ��������� ��������
    | | | | | | | + shop_name               // 7 �������� ��������
    | | | | | | | | + product_id            // 8 ��� ������ � ��������
    | | | | | | | | | + seller_phone        // 9 ������� ��������
    | | | | | | | | | | + seller_name       // 10 ��� ��������
    | | | | | | | | | | | + web_page        // 11 ��� ��������
    | | | | | | | | | | | | + image_id      // 12 id ���������� ��������
    | | | | | | | | | | | | | + item_state // 13 ��������� ����
    | | | | | | | | | | | | | |
    0 0 1 0 1 1 0 1 1 0 0 1 1 0  - clone
    0 1 1 1 1 1 1 1 1 1 1 1 0 1  - Search

    0 - ��� �������� ������ ����
    1 - ������� *)
 BuyCloneMask: string  = '00101101100110';
 BuySearchMask: string = '01111111111101';

implementation


initialization

  with BuyFieldsName do
  begin
    id                := 'id';
    date_buy          := 'date_buy';
    product_name      := 'product_name';
    count             := 'count';
    buy_price         := 'buy_price';
    guarant_period    := 'guarant_period';
    guarant_last_date := 'guarant_last_date';
    shop_name         := 'shop_name';
    product_id        := 'product_id';
    seller_phone      := 'seller_phone';
    seller_name       := 'seller_name';
    web_page          := 'web_page';
    image_id          := 'image_id';
    item_state        := 'item_state';
  end;

  with SellFieldsName do
  begin
    id            := 'id';
    date_sell     := 'date_sell';
    product_name  := 'product_name';
    count         := 'count';
    sell_price    := 'sell_price';
    buyer_phone   := 'buyer_phone';
    bayer_name    := 'bayer_name';
  end;

  GroupsFildsName.id          := 'id';
  GroupsFildsName.group_name  := 'group_name';

  BuySellFieldsName.id        := 'id';
  BuySellFieldsName.buy_id    := 'buy_id';
  BuySellFieldsName.sell_id   := 'sell_id';

  BuyGroupFieldsName.id       := 'id';
  BuyGroupFieldsName.buy_id   := 'buy_id';
  BuyGroupFieldsName.group_id := 'group_id';

  ImagesFieldsName.id         := 'id';
  ImagesFieldsName.directory  := 'directory';

end.

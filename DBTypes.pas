unit DBTypes;

interface

USES
  System.Classes;

type TSortType = (stASC, stDESC);
type TTablesName = (tnAll, tnBuyTable, tnSellTable, tnGroupsTable,
                    tnBuySellTable, tnBuyGroupTable, tnImagesTable);

Const
  // Flags Preset default
  // ���� ��������� � DBGrid, ���� ����� ����� ���, �� ���� �� ����� ������� � DBGrid
  FPD_FIELD_CREATE = $0001;

  // �� �������� ������������ DBGrid ��� �� ������
  FPD_FIELD_VISIBLE = $0002;

  // ���� ����� ��������� � ���������� ������ jvCheckedComboBox ��� ������
  FPD_FIELD_SEARCHE = $0004;

  // ����������� �������� � jvCheckedComboBox ��� ������ (�������� �������)
  FPD_FIELD_CHECKET = $0008;

  // ���� � ����� ������ ����� ������������� � ����� ������
  FPD_FIELD_CLONE   = $0010;

  // ���� ������� �������� ��� ����� �����
  FPD_PRESET_ALL    = $001F;

type
  TFieldRec = record
  Caption      : String;
  DefWidth     : Word;
  DefAlignment : TAlignment;
  FPD_FLAGS    : WORD;
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

  arTabNameStr: array[TTablesName] of string =
    ('AllTab', 'BuyTab', 'SellTab', 'GroupsTab', 'BuySellTab', 'BuyGroupTab', 'ImagesTab');

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

  arSellTabFieldsName: array[0..6] of string = (
    'id',           // 0 ID
    'date_sell',    // 1 ���� �������
    'product_name', // 2 �������� ������
    'count',        // 3 ����������
    'sell_price',   // 4 ���� �������
    'buyer_phone',  // 5 ������� ����������
    'bayer_name');  // 6 ��� ����������

  arSellTabFieldsCaption: array[0..High(arSellTabFieldsName)] of string = (
    'ID',
    '���� �������',
    '�������� ������',
    '����������',
    '���� �������',
    '������� ����������',
    '��� ����������');

  arSellFieldsWidth: array[0..High(arSellTabFieldsName)] of Word = (
     50,    // 0 ID
     100,   // 1 ���� �������
     300,   // 2 �������� ������
     50,    // 3 ����������
     100,   // 4 ���� �������
     150,   // 5 ������� ����������
     150);  // 6 ��� ����������

  arSellFieldsAlignment: array[0.. High(arSellTabFieldsName)] of TAlignment = (
     taCenter,       // 0 ID
     taCenter,       // 1 ���� �������
     taLeftJustify,  // 2 �������� ������
     taCenter,       // 3 ����������
     taCenter,       // 4 ���� �������
     taLeftJustify,  // 5 ������� ����������
     taLeftJustify); // 6 ��� ����������

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

end.

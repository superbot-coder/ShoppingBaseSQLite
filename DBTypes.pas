unit DBTypes;

interface

USES
  System.Classes;

type TSortType = (stASC, stDESC);
type TTablesName = (tnAll, tnBuyTable, tnSellTable, tnGroupsTable,
                    tnBuySellTable, tnBuyGroupTable, tnImagesTable);

Const
  // Flags Preset default
  // Поле создается в DBGrid, если этого флага нет, то поле не будет создано в DBGrid
  FPD_FIELD_CREATE = $0001;

  // По умочанию отображается DBGrid оно не скрыто
  FPD_FIELD_VISIBLE = $0002;

  // Поле будет добавлено в выпадающий список jvCheckedComboBox для поиска
  FPD_FIELD_SEARCHE = $0004;

  // Поумолчанию включено в jvCheckedComboBox для поиска (отмечена галочка)
  FPD_FIELD_CHECKET = $0008;

  // Поле с таким флагом будет клонироваться в новую запись
  FPD_FIELD_CLONE   = $0010;

  // Флаг который включает все флаги сразу
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
    'web_page',          // 11 Веб страница
    'image_id',          // 12 id директории картинок
    'item_state');       // 13 Состояние вещи

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
    'Веб страница',
    'ID картинок',
    'Состояние');

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
     150,  // 11 Веб страница
     50,   // 12 id директории картинок
     150); // 13 Состояние вещи

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
     taLeftJustify,  // 11 Веб страница
     taCenter,       // 12 id директории картинок
     taCenter);      // 13 Состояние вещи

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
    0 0 1 0 1 1 0 1 1 0 0 1 1 0  - clone
    0 1 1 1 1 1 1 1 1 1 1 1 0 1  - Search

    0 - Нет переноса записи поля
    1 - Перенос *)

 BuyCloneMask: string  = '00101101100110';
 BuySearchMask: string = '01111111111101';

implementation


initialization

end.

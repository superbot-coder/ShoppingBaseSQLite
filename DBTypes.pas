unit DBTypes;

interface

USES
  System.Classes;

type TSortType = (stASC, stDESC);
//type TTablesName = (tnAll, tnBuyTable, tnSellTable, tnGroupsTable,
//                    tnBuySellTable, tnBuyGroupTable, tnImagesTable);

type
  TTablesName = (
    tAll,         // Пратраметр задает создание всех таблиц
    tBuyTab,      // Таблица Покупок
    tSellTab,     // Таблица Продаж
    tGroupsTab,   // Таблица Группы
    tBuySellTab,  // Таблица связи (кросс-таблица) Покупок и Продаж
    tBuyGroupTab, // Таблица связи (кросс-таблица) Покупок и Групп
    tImagesTab);  // Таблица с директориями картинок

type
  TBuyFieldsNameRec = record
    id:                 string; // 0 ID
    date_buy:           string; // 1 Дата покупки
    product_name:       string; // 2 Название товара
    count:              string; // 3 Количество
    buy_price:          string; // 4 Цена
    guarant_period:     string; // 5 Срок гарантии
    guarant_last_date:  string; // 6 Дата истечения гарантии
    shop_name:          string; // 7 Название магазина
    product_id:         string; // 8 Код товара в магазине
    seller_phone:       string; // 9 Телефон продавца
    seller_name:        string; // 10 Имя продавца
    web_page:           string; // 11 Веб страница
    image_id:           string; // 12 id директории картинок
    item_state:         string; // 13 Состояние вещи
  end;

type
  TSellFieldsNameRec = record
    id           : string; // 0 ID
    date_sell    : string; // 1 Дата продажи
    product_name : string; // 2 Название товара
    count        : string; // 3 Количество
    sell_price   : string; // 4 Цена продажи
    buyer_phone  : string; // 5 Телефон покупателя
    bayer_name   : string; // 6 Имя покупателя
  end;

type
  TGroupsFildsNameRec = record
    id         : string; // ИД Группы
    group_name : string; // Название группы
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
    bf_date_buy,          // 1 Дата покупки
    bf_product_name,      // 2 Название товара
    bf_count,             // 3 Количество
    bf_buy_price,         // 4 Цена
    bf_guarant_period,    // 5 Срок гарантии
    bf_guarant_last_date, // 6 Дата истечения гарантии
    bf_shop_name,         // 7 Название магазина
    bf_product_id,        // 8 Код товара в магазине
    bf_seller_phone,      // 9 Телефон продавца
    bf_seller_name,       // 10 Имя продавца
    bf_web_page,          // 11 Веб страница
    bf_image_id,          // 12 id директории картинок
    bf_item_state);       // 13 Состояние вещи

type
  TSellFieldsType = (
    sf_id,           // 0 ID
    sf_date_sell,    // 1 Дата продажи
    sf_product_name, // 2 Название товара
    sf_count,        // 3 Количество
    sf_sell_price,   // 4 Цена продажи
    sf_buyer_phone,  // 5 Телефон покупателя
    sf_bayer_name);  // 6 Имя покупателя

type
  TFieldsPerest = (
    fpCreate,   // Поле создается в DBGrid, если этого параметра нет, то поле не будет создано в DBGrid
    fpVisible,  // По умочанию отображается DBGrid оно не скрыто
    fpSearch,   // Поле будет добавлено в выпадающий список jvCheckedComboBox для поиска
    fpChecket,  // Поумолчанию включено в jvCheckedComboBox для поиска (отмечена галочка)
    fpClone);   // Поле с таким флагом будет клонироваться в новую запись

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
   }
  arSellFields: array[0..6] of string = (
    'id',           // 0 ID
    'date_sell',    // 1 Дата продажи
    'product_name', // 2 Название товара
    'count',        // 3 Количество
    'sell_price',   // 4 Цена продажи
    'buyer_phone',  // 5 Телефон покупателя
    'bayer_name');  // 6 Имя покупателя

  arSellFieldsCaption: array[0..High(arSellFields)] of string = (
    'ID',
    'Дата продажи',
    'Название товара',
    'Количество',
    'Цена продажи',
    'Телефон покупателя',
    'Имя покупателя');

  arSellFieldsWidth: array[0..High(arSellFields)] of Word = (
     50,    // 0 ID
     100,   // 1 Дата продажи
     300,   // 2 Название товара
     50,    // 3 Количество
     100,   // 4 Цена продажи
     150,   // 5 Телефон покупателя
     150);  // 6 Имя покупателя

  arSellFieldsAlignment: array[0.. High(arSellFields)] of TAlignment = (
     taCenter,       // 0 ID
     taCenter,       // 1 Дата продажи
     taLeftJustify,  // 2 Название товара
     taCenter,       // 3 Количество
     taCenter,       // 4 Цена продажи
     taLeftJustify,  // 5 Телефон покупателя
     taLeftJustify); // 6 Имя покупателя

  BuyFieldsName      : TBuyFieldsNameRec;
  SellFieldsName     : TSellFieldsNameRec;
  GroupsFildsName    : TGroupsFildsNameRec;
  BuySellFieldsName  : TBuySellFieldsNameRec;
  BuyGroupFieldsName : TBuyGroupFieldsNameRec;
  ImagesFieldsName   : TImagesFieldsNameRec;

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

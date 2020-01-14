import 'dart:convert';
class CartData {
    final String allocatedOrderNumber;
    final String code;
    final List<dynamic> appliedOrderPromotions;
    final List<dynamic> appliedProductPromotions;
    final List<dynamic> appliedVouchers;
    final dynamic deliveryCost;
    final dynamic deliveryAddress;
    final dynamic deliveryMode;
    final List<Entry> entries;
    final String guid;
    final List<dynamic> potentialOrderPromotions;
    final List<dynamic> potentialProductPromotions;
    final SubTotal subTotal;
    final Total totalDiscounts;
    final int totalItems;
    final Price totalPrice;
    final SubTotal totalPriceWithTax;
    final SubTotal totalTax;
    final int totalUnitCount;

    CartData({
        this.allocatedOrderNumber,
        this.code,
        this.appliedOrderPromotions,
        this.appliedProductPromotions,
        this.appliedVouchers,
        this.deliveryCost,
        this.deliveryAddress,
        this.deliveryMode,
        this.entries,
        this.guid,
        this.potentialOrderPromotions,
        this.potentialProductPromotions,
        this.subTotal,
        this.totalDiscounts,
        this.totalItems,
        this.totalPrice,
        this.totalPriceWithTax,
        this.totalTax,
        this.totalUnitCount,
    });

    factory CartData.fromJson(String str) => CartData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CartData.fromMap(Map<String, dynamic> json) => CartData(
        allocatedOrderNumber: json["allocatedOrderNumber"] == null ? null : json["allocatedOrderNumber"],
        code: json["code"] == null ? null : json["code"],
        appliedOrderPromotions: json["appliedOrderPromotions"] == null ? null : List<dynamic>.from(json["appliedOrderPromotions"].map((x) => x)),
        appliedProductPromotions: json["appliedProductPromotions"] == null ? null : List<dynamic>.from(json["appliedProductPromotions"].map((x) => x)),
        appliedVouchers: json["appliedVouchers"] == null ? null : List<dynamic>.from(json["appliedVouchers"].map((x) => x)),
        deliveryCost: json["deliveryCost"],
        deliveryAddress: json["deliveryAddress"],
        deliveryMode: json["deliveryMode"],
        entries: json["entries"] == null ? null : List<Entry>.from(json["entries"].map((x) => Entry.fromMap(x))),
        guid: json["guid"] == null ? null : json["guid"],
        potentialOrderPromotions: json["potentialOrderPromotions"] == null ? null : List<dynamic>.from(json["potentialOrderPromotions"].map((x) => x)),
        potentialProductPromotions: json["potentialProductPromotions"] == null ? null : List<dynamic>.from(json["potentialProductPromotions"].map((x) => x)),
        subTotal: json["subTotal"] == null ? null : SubTotal.fromMap(json["subTotal"]),
        totalDiscounts: json["totalDiscounts"] == null ? null : Total.fromMap(json["totalDiscounts"]),
        totalItems: json["totalItems"] == null ? null : json["totalItems"],
        totalPrice: json["totalPrice"] == null ? null : Price.fromMap(json["totalPrice"]),
        totalPriceWithTax: json["totalPriceWithTax"] == null ? null : SubTotal.fromMap(json["totalPriceWithTax"]),
        totalTax: json["totalTax"] == null ? null : SubTotal.fromMap(json["totalTax"]),
        totalUnitCount: json["totalUnitCount"] == null ? null : json["totalUnitCount"],
    );

    Map<String, dynamic> toMap() => {
        "allocatedOrderNumber": allocatedOrderNumber == null ? null : allocatedOrderNumber,
        "code": code == null ? null : code,
        "appliedOrderPromotions": appliedOrderPromotions == null ? null : List<dynamic>.from(appliedOrderPromotions.map((x) => x)),
        "appliedProductPromotions": appliedProductPromotions == null ? null : List<dynamic>.from(appliedProductPromotions.map((x) => x)),
        "appliedVouchers": appliedVouchers == null ? null : List<dynamic>.from(appliedVouchers.map((x) => x)),
        "deliveryCost": deliveryCost,
        "deliveryAddress": deliveryAddress,
        "deliveryMode": deliveryMode,
        "entries": entries == null ? null : List<dynamic>.from(entries.map((x) => x.toMap())),
        "guid": guid == null ? null : guid,
        "potentialOrderPromotions": potentialOrderPromotions == null ? null : List<dynamic>.from(potentialOrderPromotions.map((x) => x)),
        "potentialProductPromotions": potentialProductPromotions == null ? null : List<dynamic>.from(potentialProductPromotions.map((x) => x)),
        "subTotal": subTotal == null ? null : subTotal.toMap(),
        "totalDiscounts": totalDiscounts == null ? null : totalDiscounts.toMap(),
        "totalItems": totalItems == null ? null : totalItems,
        "totalPrice": totalPrice == null ? null : totalPrice.toMap(),
        "totalPriceWithTax": totalPriceWithTax == null ? null : totalPriceWithTax.toMap(),
        "totalTax": totalTax == null ? null : totalTax.toMap(),
        "totalUnitCount": totalUnitCount == null ? null : totalUnitCount,
    };
}

class Entry {
    final bool isExcludedFromAvailabilityCheck;
    final Price basePrice;
    final int entryNumber;
    final Product product;
    final int quantity;
    final Total totalPrice;

    Entry({
        this.isExcludedFromAvailabilityCheck,
        this.basePrice,
        this.entryNumber,
        this.product,
        this.quantity,
        this.totalPrice,
    });

    factory Entry.fromJson(String str) => Entry.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Entry.fromMap(Map<String, dynamic> json) => Entry(
        isExcludedFromAvailabilityCheck: json["isExcludedFromAvailabilityCheck"] == null ? null : json["isExcludedFromAvailabilityCheck"],
        basePrice: json["basePrice"] == null ? null : Price.fromMap(json["basePrice"]),
        entryNumber: json["entryNumber"] == null ? null : json["entryNumber"],
        product: json["product"] == null ? null : Product.fromMap(json["product"]),
        quantity: json["quantity"] == null ? null : json["quantity"],
        totalPrice: json["totalPrice"] == null ? null : Total.fromMap(json["totalPrice"]),
    );

    Map<String, dynamic> toMap() => {
        "isExcludedFromAvailabilityCheck": isExcludedFromAvailabilityCheck == null ? null : isExcludedFromAvailabilityCheck,
        "basePrice": basePrice == null ? null : basePrice.toMap(),
        "entryNumber": entryNumber == null ? null : entryNumber,
        "product": product == null ? null : product.toMap(),
        "quantity": quantity == null ? null : quantity,
        "totalPrice": totalPrice == null ? null : totalPrice.toMap(),
    };
}

class Price {
    final String formattedValue;
    final int value;
    final String currencyIso;

    Price({
        this.formattedValue,
        this.value,
        this.currencyIso,
    });

    factory Price.fromJson(String str) => Price.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Price.fromMap(Map<String, dynamic> json) => Price(
        formattedValue: json["formattedValue"] == null ? null : json["formattedValue"],
        value: json["value"] == null ? null : json["value"],
        currencyIso: json["currencyIso"] == null ? null : json["currencyIso"],
    );

    Map<String, dynamic> toMap() => {
        "formattedValue": formattedValue == null ? null : formattedValue,
        "value": value == null ? null : value,
        "currencyIso": currencyIso == null ? null : currencyIso,
    };
}

class Product {
    final String altText;
    final List<BaseOption> baseOptions;
    final String baseProduct;
    final List<Category> categories;
    final List<dynamic> categoryNames;
    final String code;
    final String colorName;
    final dynamic description;
    final List<Image> images;
    final int maxOrderQuantity;
    final dynamic merchantBadge;
    final int minOrderQuantity;
    final String name;
    final PriceClass price;
    final Stock stock;

    Product({
        this.altText,
        this.baseOptions,
        this.baseProduct,
        this.categories,
        this.categoryNames,
        this.code,
        this.colorName,
        this.description,
        this.images,
        this.maxOrderQuantity,
        this.merchantBadge,
        this.minOrderQuantity,
        this.name,
        this.price,
        this.stock,
    });

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        altText: json["altText"] == null ? null : json["altText"],
        baseOptions: json["baseOptions"] == null ? null : List<BaseOption>.from(json["baseOptions"].map((x) => BaseOption.fromMap(x))),
        baseProduct: json["baseProduct"] == null ? null : json["baseProduct"],
        categories: json["categories"] == null ? null : List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
        categoryNames: json["categoryNames"] == null ? null : List<dynamic>.from(json["categoryNames"].map((x) => x)),
        code: json["code"] == null ? null : json["code"],
        colorName: json["colorName"] == null ? null : json["colorName"],
        description: json["description"],
        images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        maxOrderQuantity: json["maxOrderQuantity"] == null ? null : json["maxOrderQuantity"],
        merchantBadge: json["merchantBadge"],
        minOrderQuantity: json["minOrderQuantity"] == null ? null : json["minOrderQuantity"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : PriceClass.fromMap(json["price"]),
        stock: json["stock"] == null ? null : Stock.fromMap(json["stock"]),
    );

    Map<String, dynamic> toMap() => {
        "altText": altText == null ? null : altText,
        "baseOptions": baseOptions == null ? null : List<dynamic>.from(baseOptions.map((x) => x.toMap())),
        "baseProduct": baseProduct == null ? null : baseProduct,
        "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toMap())),
        "categoryNames": categoryNames == null ? null : List<dynamic>.from(categoryNames.map((x) => x)),
        "code": code == null ? null : code,
        "colorName": colorName == null ? null : colorName,
        "description": description,
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toMap())),
        "maxOrderQuantity": maxOrderQuantity == null ? null : maxOrderQuantity,
        "merchantBadge": merchantBadge,
        "minOrderQuantity": minOrderQuantity == null ? null : minOrderQuantity,
        "name": name == null ? null : name,
        "price": price == null ? null : price.toMap(),
        "stock": stock == null ? null : stock.toMap(),
    };
}

class BaseOption {
    final Selected selected;
    final String variantType;

    BaseOption({
        this.selected,
        this.variantType,
    });

    factory BaseOption.fromJson(String str) => BaseOption.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BaseOption.fromMap(Map<String, dynamic> json) => BaseOption(
        selected: json["selected"] == null ? null : Selected.fromMap(json["selected"]),
        variantType: json["variantType"] == null ? null : json["variantType"],
    );

    Map<String, dynamic> toMap() => {
        "selected": selected == null ? null : selected.toMap(),
        "variantType": variantType == null ? null : variantType,
    };
}

class Selected {
    final String displaySizeDescription;

    Selected({
        this.displaySizeDescription,
    });

    factory Selected.fromJson(String str) => Selected.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Selected.fromMap(Map<String, dynamic> json) => Selected(
        displaySizeDescription: json["displaySizeDescription"] == null ? null : json["displaySizeDescription"],
    );

    Map<String, dynamic> toMap() => {
        "displaySizeDescription": displaySizeDescription == null ? null : displaySizeDescription,
    };
}

class Category {
    final String code;
    final dynamic image;
    final String url;

    Category({
        this.code,
        this.image,
        this.url,
    });

    factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        code: json["code"] == null ? null : json["code"],
        image: json["image"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
        "image": image,
        "url": url == null ? null : url,
    };
}

class Image {
    final dynamic altText;
    final String format;
    final dynamic galleryIndex;
    final String imageType;
    final String url;

    Image({
        this.altText,
        this.format,
        this.galleryIndex,
        this.imageType,
        this.url,
    });

    factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Image.fromMap(Map<String, dynamic> json) => Image(
        altText: json["altText"],
        format: json["format"] == null ? null : json["format"],
        galleryIndex: json["galleryIndex"],
        imageType: json["imageType"] == null ? null : json["imageType"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toMap() => {
        "altText": altText,
        "format": format == null ? null : format,
        "galleryIndex": galleryIndex,
        "imageType": imageType == null ? null : imageType,
        "url": url == null ? null : url,
    };
}

class PriceClass {
    final dynamic code;
    final String currencyIso;
    final String formattedValue;
    final int hardPrice;
    final String hardPriceFormattedValue;
    final dynamic maxQuantity;
    final dynamic minQuantity;
    final String priceType;
    final int regularPrice;
    final String regularPriceFormattedValue;
    final dynamic softPrice;
    final dynamic softPriceFormattedValue;
    final int value;

    PriceClass({
        this.code,
        this.currencyIso,
        this.formattedValue,
        this.hardPrice,
        this.hardPriceFormattedValue,
        this.maxQuantity,
        this.minQuantity,
        this.priceType,
        this.regularPrice,
        this.regularPriceFormattedValue,
        this.softPrice,
        this.softPriceFormattedValue,
        this.value,
    });

    factory PriceClass.fromJson(String str) => PriceClass.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PriceClass.fromMap(Map<String, dynamic> json) => PriceClass(
        code: json["code"],
        currencyIso: json["currencyIso"] == null ? null : json["currencyIso"],
        formattedValue: json["formattedValue"] == null ? null : json["formattedValue"],
        hardPrice: json["hardPrice"] == null ? null : json["hardPrice"],
        hardPriceFormattedValue: json["hardPriceFormattedValue"] == null ? null : json["hardPriceFormattedValue"],
        maxQuantity: json["maxQuantity"],
        minQuantity: json["minQuantity"],
        priceType: json["priceType"] == null ? null : json["priceType"],
        regularPrice: json["regularPrice"] == null ? null : json["regularPrice"],
        regularPriceFormattedValue: json["regularPriceFormattedValue"] == null ? null : json["regularPriceFormattedValue"],
        softPrice: json["softPrice"],
        softPriceFormattedValue: json["softPriceFormattedValue"],
        value: json["value"] == null ? null : json["value"],
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "currencyIso": currencyIso == null ? null : currencyIso,
        "formattedValue": formattedValue == null ? null : formattedValue,
        "hardPrice": hardPrice == null ? null : hardPrice,
        "hardPriceFormattedValue": hardPriceFormattedValue == null ? null : hardPriceFormattedValue,
        "maxQuantity": maxQuantity,
        "minQuantity": minQuantity,
        "priceType": priceType == null ? null : priceType,
        "regularPrice": regularPrice == null ? null : regularPrice,
        "regularPriceFormattedValue": regularPriceFormattedValue == null ? null : regularPriceFormattedValue,
        "softPrice": softPrice,
        "softPriceFormattedValue": softPriceFormattedValue,
        "value": value == null ? null : value,
    };
}

class Stock {
    final int stockLevel;
    final String stockLevelStatus;

    Stock({
        this.stockLevel,
        this.stockLevelStatus,
    });

    factory Stock.fromJson(String str) => Stock.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Stock.fromMap(Map<String, dynamic> json) => Stock(
        stockLevel: json["stockLevel"] == null ? null : json["stockLevel"],
        stockLevelStatus: json["stockLevelStatus"] == null ? null : json["stockLevelStatus"],
    );

    Map<String, dynamic> toMap() => {
        "stockLevel": stockLevel == null ? null : stockLevel,
        "stockLevelStatus": stockLevelStatus == null ? null : stockLevelStatus,
    };
}

class Total {
    final String formattedValue;
    final int value;

    Total({
        this.formattedValue,
        this.value,
    });

    factory Total.fromJson(String str) => Total.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Total.fromMap(Map<String, dynamic> json) => Total(
        formattedValue: json["formattedValue"] == null ? null : json["formattedValue"],
        value: json["value"] == null ? null : json["value"],
    );

    Map<String, dynamic> toMap() => {
        "formattedValue": formattedValue == null ? null : formattedValue,
        "value": value == null ? null : value,
    };
}

class SubTotal {
    final String formattedValue;

    SubTotal({
        this.formattedValue,
    });

    factory SubTotal.fromJson(String str) => SubTotal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SubTotal.fromMap(Map<String, dynamic> json) => SubTotal(
        formattedValue: json["formattedValue"] == null ? null : json["formattedValue"],
    );

    Map<String, dynamic> toMap() => {
        "formattedValue": formattedValue == null ? null : formattedValue,
    };
}

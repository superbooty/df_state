import 'dart:convert';

import 'package:flutter/material.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  String altText;
  double averageOverallRatings;
  String baseProduct;
  List<Classification> classifications;
  String code;
  String colorGroup;
  String colorName;
  bool customizable;
  String description;
  bool findInStoreEligible;
  List<LscoBreadcrumb> lscoBreadcrumbs;
  GalleryImageList galleryImageList;
  dynamic images;
  String itemType;
  int maxOrderQuantity;
  dynamic merchantBadge;
  int minOrderQuantity;
  bool multidimensional;
  Name name;
  int noOfRatings;
  List<dynamic> potentialPromotions;
  Price price;
  dynamic promotionalBadge;
  bool purchasable;
  SeoMetaData seoMetaData;
  String sizeGuide;
  bool soldIndividually;
  bool soldOutForever;
  String summary;
  String url;
  List<String> variantLength;
  List<VariantOption> variantOptions;
  dynamic variantSize;
  String variantType;
  List<String> variantWaist;

  Product({
    this.altText,
    this.averageOverallRatings,
    this.baseProduct,
    this.classifications,
    this.code,
    this.colorGroup,
    this.colorName,
    this.customizable,
    this.description,
    this.findInStoreEligible,
    this.lscoBreadcrumbs,
    this.galleryImageList,
    this.images,
    this.itemType,
    this.maxOrderQuantity,
    this.merchantBadge,
    this.minOrderQuantity,
    this.multidimensional,
    this.name,
    this.noOfRatings,
    this.potentialPromotions,
    this.price,
    this.promotionalBadge,
    this.purchasable,
    this.seoMetaData,
    this.sizeGuide,
    this.soldIndividually,
    this.soldOutForever,
    this.summary,
    this.url,
    this.variantLength,
    this.variantOptions,
    this.variantSize,
    this.variantType,
    this.variantWaist,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        altText: json["altText"] == null ? null : json["altText"],
        averageOverallRatings: json["averageOverallRatings"] == null
            ? null
            : json["averageOverallRatings"],
        baseProduct: json["baseProduct"] == null ? null : json["baseProduct"],
        classifications: json["classifications"] == null
            ? null
            : List<Classification>.from(
                json["classifications"].map((x) => Classification.fromJson(x))),
        code: json["code"] == null ? null : json["code"],
        colorGroup: json["colorGroup"] == null ? null : json["colorGroup"],
        colorName: json["colorName"] == null ? null : json["colorName"],
        customizable:
            json["customizable"] == null ? null : json["customizable"],
        description: json["description"] == null ? null : json["description"],
        findInStoreEligible: json["findInStoreEligible"] == null
            ? null
            : json["findInStoreEligible"],
        lscoBreadcrumbs: json["lscoBreadcrumbs"] == null
            ? null
            : List<LscoBreadcrumb>.from(
                json["lscoBreadcrumbs"].map((x) => LscoBreadcrumb.fromJson(x))),
        galleryImageList: json["galleryImageList"] == null
            ? null
            : GalleryImageList.fromJson(json["galleryImageList"]),
        images: json["images"],
        itemType: json["itemType"] == null ? null : json["itemType"],
        maxOrderQuantity:
            json["maxOrderQuantity"] == null ? null : json["maxOrderQuantity"],
        merchantBadge: json["merchantBadge"],
        minOrderQuantity:
            json["minOrderQuantity"] == null ? null : json["minOrderQuantity"],
        multidimensional:
            json["multidimensional"] == null ? null : json["multidimensional"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        noOfRatings: json["noOfRatings"] == null ? null : json["noOfRatings"],
        potentialPromotions: json["potentialPromotions"] == null
            ? null
            : List<dynamic>.from(json["potentialPromotions"].map((x) => x)),
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        promotionalBadge: json["promotionalBadge"],
        purchasable: json["purchasable"] == null ? null : json["purchasable"],
        seoMetaData: json["seoMetaData"] == null
            ? null
            : SeoMetaData.fromJson(json["seoMetaData"]),
        sizeGuide: json["sizeGuide"] == null ? null : json["sizeGuide"],
        soldIndividually:
            json["soldIndividually"] == null ? null : json["soldIndividually"],
        soldOutForever:
            json["soldOutForever"] == null ? null : json["soldOutForever"],
        summary: json["summary"] == null ? null : json["summary"],
        url: json["url"] == null ? null : json["url"],
        variantLength: json["variantLength"] == null
            ? null
            : List<String>.from(json["variantLength"].map((x) => x)),
        variantOptions: json["variantOptions"] == null
            ? null
            : List<VariantOption>.from(
                json["variantOptions"].map((x) => VariantOption.fromJson(x))),
        variantSize: json["variantSize"],
        variantType: json["variantType"] == null ? null : json["variantType"],
        variantWaist: json["variantWaist"] == null
            ? null
            : List<String>.from(json["variantWaist"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "altText": altText == null ? null : altText,
        "averageOverallRatings":
            averageOverallRatings == null ? null : averageOverallRatings,
        "baseProduct": baseProduct == null ? null : baseProduct,
        "classifications": classifications == null
            ? null
            : List<dynamic>.from(classifications.map((x) => x.toJson())),
        "code": code == null ? null : code,
        "colorGroup": colorGroup == null ? null : colorGroup,
        "colorName": colorName == null ? null : colorName,
        "customizable": customizable == null ? null : customizable,
        "description": description == null ? null : description,
        "findInStoreEligible":
            findInStoreEligible == null ? null : findInStoreEligible,
        "lscoBreadcrumbs": lscoBreadcrumbs == null
            ? null
            : List<dynamic>.from(lscoBreadcrumbs.map((x) => x.toJson())),
        "galleryImageList":
            galleryImageList == null ? null : galleryImageList.toJson(),
        "images": images,
        "itemType": itemType == null ? null : itemType,
        "maxOrderQuantity": maxOrderQuantity == null ? null : maxOrderQuantity,
        "merchantBadge": merchantBadge,
        "minOrderQuantity": minOrderQuantity == null ? null : minOrderQuantity,
        "multidimensional": multidimensional == null ? null : multidimensional,
        "name": name == null ? null : nameValues.reverse[name],
        "noOfRatings": noOfRatings == null ? null : noOfRatings,
        "potentialPromotions": potentialPromotions == null
            ? null
            : List<dynamic>.from(potentialPromotions.map((x) => x)),
        "price": price == null ? null : price.toJson(),
        "promotionalBadge": promotionalBadge,
        "purchasable": purchasable == null ? null : purchasable,
        "seoMetaData": seoMetaData == null ? null : seoMetaData.toJson(),
        "sizeGuide": sizeGuide == null ? null : sizeGuide,
        "soldIndividually": soldIndividually == null ? null : soldIndividually,
        "soldOutForever": soldOutForever == null ? null : soldOutForever,
        "summary": summary == null ? null : summary,
        "url": url == null ? null : url,
        "variantLength": variantLength == null
            ? null
            : List<dynamic>.from(variantLength.map((x) => x)),
        "variantOptions": variantOptions == null
            ? null
            : List<dynamic>.from(variantOptions.map((x) => x.toJson())),
        "variantSize": variantSize,
        "variantType": variantType == null ? null : variantType,
        "variantWaist": variantWaist == null
            ? null
            : List<dynamic>.from(variantWaist.map((x) => x)),
      };
}

class Classification {
  String code;
  List<Feature> features;
  String name;
  String typename;

  Classification({
    this.code,
    this.features,
    this.name,
    this.typename,
  });

  factory Classification.fromJson(Map<String, dynamic> json) => Classification(
        code: json["code"] == null ? null : json["code"],
        features: json["features"] == null
            ? null
            : List<Feature>.from(
                json["features"].map((x) => Feature.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "features": features == null
            ? null
            : List<dynamic>.from(features.map((x) => x.toJson())),
        "name": name == null ? null : name,
      };
}

class Feature {
  String code;
  bool comparable;
  dynamic description;
  dynamic featureUnit;
  List<FeatureValue> featureValues;
  String name;
  bool range;
  dynamic type;

  Feature({
    this.code,
    this.comparable,
    this.description,
    this.featureUnit,
    this.featureValues,
    this.name,
    this.range,
    this.type,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        code: json["code"] == null ? null : json["code"],
        comparable: json["comparable"] == null ? null : json["comparable"],
        description: json["description"],
        featureUnit: json["featureUnit"],
        featureValues: json["featureValues"] == null
            ? null
            : List<FeatureValue>.from(
                json["featureValues"].map((x) => FeatureValue.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        range: json["range"] == null ? null : json["range"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "comparable": comparable == null ? null : comparable,
        "description": description,
        "featureUnit": featureUnit,
        "featureValues": featureValues == null
            ? null
            : List<dynamic>.from(featureValues.map((x) => x.toJson())),
        "name": name == null ? null : name,
        "range": range == null ? null : range,
        "type": type,
      };
}

class FeatureValue {
  String value;

  FeatureValue({
    this.value,
  });

  factory FeatureValue.fromJson(Map<String, dynamic> json) => FeatureValue(
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
      };
}

class GalleryImageList {
  List<GalleryImage> galleryImage;
  dynamic videos;

  GalleryImageList({
    this.galleryImage,
    this.videos,
  });

  factory GalleryImageList.fromJson(Map<String, dynamic> json) =>
      GalleryImageList(
        galleryImage: json["galleryImage"] == null
            ? null
            : List<GalleryImage>.from(
                json["galleryImage"].map((x) => GalleryImage.fromJson(x))),
        videos: json["videos"],
      );

  Map<String, dynamic> toJson() => {
        "galleryImage": galleryImage == null
            ? null
            : List<dynamic>.from(galleryImage.map((x) => x.toJson())),
        "videos": videos,
      };
}

class GalleryImage {
  Name altText;
  Format format;
  int galleryIndex;
  ImageType imageType;
  String url;

  GalleryImage({
    this.altText,
    this.format,
    this.galleryIndex,
    this.imageType,
    this.url,
  });

  factory GalleryImage.fromJson(Map<String, dynamic> json) => GalleryImage(
        altText:
            json["altText"] == null ? null : nameValues.map[json["altText"]],
        format:
            json["format"] == null ? null : formatValues.map[json["format"]],
        galleryIndex:
            json["galleryIndex"] == null ? null : json["galleryIndex"],
        imageType: json["imageType"] == null
            ? null
            : imageTypeValues.map[json["imageType"]],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "altText": altText == null ? null : nameValues.reverse[altText],
        "format": format == null ? null : formatValues.reverse[format],
        "galleryIndex": galleryIndex == null ? null : galleryIndex,
        "imageType":
            imageType == null ? null : imageTypeValues.reverse[imageType],
        "url": url == null ? null : url,
      };
}

enum Name { THE_511_SLIM_FIT_JEANS }

final nameValues =
    EnumValues({"511™ Slim Fit Jeans": Name.THE_511_SLIM_FIT_JEANS});

enum Format { THUMB_MOBILE, REGULAR_MOBILE }

final formatValues = EnumValues({
  "Regular_Mobile": Format.REGULAR_MOBILE,
  "Thumb_Mobile": Format.THUMB_MOBILE
});

enum ImageType { GALLERY }

final imageTypeValues = EnumValues({"GALLERY": ImageType.GALLERY});

class LscoBreadcrumb {
  String categoryCode;
  String name;
  String url;
  String typename;

  LscoBreadcrumb({
    this.categoryCode,
    this.name,
    this.url,
    this.typename,
  });

  factory LscoBreadcrumb.fromJson(Map<String, dynamic> json) => LscoBreadcrumb(
        categoryCode:
            json["categoryCode"] == null ? null : json["categoryCode"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "categoryCode": categoryCode == null ? null : categoryCode,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

class Price {
  dynamic code;
  CurrencyIso currencyIso;
  FormattedValue formattedValue;
  dynamic hardPrice;
  dynamic hardPriceFormattedValue;
  dynamic maxQuantity;
  dynamic minQuantity;
  PriceType priceType;
  dynamic regularPrice;
  FormattedValue regularPriceFormattedValue;
  dynamic softPrice;
  dynamic softPriceFormattedValue;
  dynamic value;

  Price({
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

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        code: json["code"],
        currencyIso: json["currencyIso"] == null
            ? null
            : currencyIsoValues.map[json["currencyIso"]],
        formattedValue: json["formattedValue"] == null
            ? null
            : formattedValueValues.map[json["formattedValue"]],
        hardPrice: json["hardPrice"],
        hardPriceFormattedValue: json["hardPriceFormattedValue"],
        maxQuantity: json["maxQuantity"],
        minQuantity: json["minQuantity"],
        priceType: json["priceType"] == null
            ? null
            : priceTypeValues.map[json["priceType"]],
        regularPrice:
            json["regularPrice"] == null ? null : json["regularPrice"],
        regularPriceFormattedValue: json["regularPriceFormattedValue"] == null
            ? null
            : formattedValueValues.map[json["regularPriceFormattedValue"]],
        softPrice: json["softPrice"],
        softPriceFormattedValue: json["softPriceFormattedValue"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "currencyIso":
            currencyIso == null ? null : currencyIsoValues.reverse[currencyIso],
        "formattedValue": formattedValue == null
            ? null
            : formattedValueValues.reverse[formattedValue],
        "hardPrice": hardPrice,
        "hardPriceFormattedValue": hardPriceFormattedValue,
        "maxQuantity": maxQuantity,
        "minQuantity": minQuantity,
        "priceType":
            priceType == null ? null : priceTypeValues.reverse[priceType],
        "regularPrice": regularPrice == null ? null : regularPrice,
        "regularPriceFormattedValue": regularPriceFormattedValue == null
            ? null
            : formattedValueValues.reverse[regularPriceFormattedValue],
        "softPrice": softPrice,
        "softPriceFormattedValue": softPriceFormattedValue,
        "value": value == null ? null : value,
      };
}

enum CurrencyIso { EUR }

final currencyIsoValues = EnumValues({"EUR": CurrencyIso.EUR});

enum FormattedValue { THE_11500 }

final formattedValueValues = EnumValues({"€115.00": FormattedValue.THE_11500});

enum PriceType { BUY }

final priceTypeValues = EnumValues({"BUY": PriceType.BUY});

class SeoMetaData {
  String metaDescription;
  Name metaH1;
  String metaTitle;
  String robots;

  SeoMetaData({
    this.metaDescription,
    this.metaH1,
    this.metaTitle,
    this.robots,
  });

  factory SeoMetaData.fromJson(Map<String, dynamic> json) => SeoMetaData(
        metaDescription:
            json["metaDescription"] == null ? null : json["metaDescription"],
        metaH1: json["metaH1"] == null ? null : nameValues.map[json["metaH1"]],
        metaTitle: json["metaTitle"] == null ? null : json["metaTitle"],
        robots: json["robots"] == null ? null : json["robots"],
      );

  Map<String, dynamic> toJson() => {
        "metaDescription": metaDescription == null ? null : metaDescription,
        "metaH1": metaH1 == null ? null : nameValues.reverse[metaH1],
        "metaTitle": metaTitle == null ? null : metaTitle,
        "robots": robots == null ? null : robots,
      };
}

class VariantOption {
  String code;
  dynamic colorName;
  String displaySizeDescription;
  dynamic maxOrderQuantity;
  dynamic minOrderQuantity;
  Price priceData;
  Stock stock;
  String url;
  dynamic variantOptionQualifiers;

  VariantOption({
    this.code,
    this.colorName,
    this.displaySizeDescription,
    this.maxOrderQuantity,
    this.minOrderQuantity,
    this.priceData,
    this.stock,
    this.url,
    this.variantOptionQualifiers,
  });

  factory VariantOption.fromJson(Map<String, dynamic> json) => VariantOption(
        code: json["code"] == null ? null : json["code"],
        colorName: json["colorName"],
        displaySizeDescription: json["displaySizeDescription"] == null
            ? null
            : json["displaySizeDescription"],
        maxOrderQuantity: json["maxOrderQuantity"],
        minOrderQuantity: json["minOrderQuantity"],
        priceData: json["priceData"] == null
            ? null
            : Price.fromJson(json["priceData"]),
        stock: json["stock"] == null ? null : Stock.fromJson(json["stock"]),
        url: json["url"] == null ? null : json["url"],
        variantOptionQualifiers: json["variantOptionQualifiers"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "colorName": colorName,
        "displaySizeDescription":
            displaySizeDescription == null ? null : displaySizeDescription,
        "maxOrderQuantity": maxOrderQuantity,
        "minOrderQuantity": minOrderQuantity,
        "priceData": priceData == null ? null : priceData.toJson(),
        "stock": stock == null ? null : stock.toJson(),
        "url": url == null ? null : url,
        "variantOptionQualifiers": variantOptionQualifiers,
      };
}

class Stock {
  int stockLevel;
  StockLevelStatus stockLevelStatus;

  Stock({
    this.stockLevel,
    this.stockLevelStatus,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        stockLevel: json["stockLevel"] == null ? null : json["stockLevel"],
        stockLevelStatus: json["stockLevelStatus"] == null
            ? null
            : stockLevelStatusValues.map[json["stockLevelStatus"]],
      );

  Map<String, dynamic> toJson() => {
        "stockLevel": stockLevel == null ? null : stockLevel,
        "stockLevelStatus": stockLevelStatus == null
            ? null
            : stockLevelStatusValues.reverse[stockLevelStatus],
      };
}

enum StockLevelStatus { IN_STOCK, OUT_OF_STOCK, LOW_STOCK }

final stockLevelStatusValues = EnumValues({
  "inStock": StockLevelStatus.IN_STOCK,
  "lowStock": StockLevelStatus.LOW_STOCK,
  "outOfStock": StockLevelStatus.OUT_OF_STOCK
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

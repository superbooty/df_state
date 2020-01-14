import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../models/cart/cart_data.dart';

const contentJson = '''
{
  "allocatedOrderNumber": "1022073661",
  "code": "1022073660",
  "appliedOrderPromotions": [],
  "appliedProductPromotions": [],
  "appliedVouchers": [],
  "deliveryCost": null,
  "deliveryAddress": null,
  "deliveryMode": null,
  "entries": [
    {
      "isExcludedFromAvailabilityCheck": false,
      "basePrice": {
        "formattedValue": "€70.00",
        "value": 70,
        "currencyIso": "EUR"
      },
      "entryNumber": 0,
      "product": {
        "altText": "Women-Women-312™ Shaping Slim Jeans-Grey Horizons",
        "baseOptions": [
          {
            "selected": {
              "displaySizeDescription": "33W X 32L"
            },
            "variantType": "PC13Product"
          },
          {
            "selected": {
              "displaySizeDescription": null
            },
            "variantType": "PC9Product"
          }
        ],
        "baseProduct": "196270102",
        "categories": [
          {
            "code": "levi_clothing",
            "image": null,
            "url": "/clothing/c/levi_clothing"
          },
          {
            "code": "levi_clothing_women",
            "image": null,
            "url": "/clothing/women/c/levi_clothing_women"
          }
        ],
        "categoryNames": [],
        "code": "19627010203332",
        "colorName": "Grey Horizons - Grey",
        "description": null,
        "images": [
          {
            "altText": null,
            "format": "Cart_Mobile",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$cart_mobile_full\$"
          },
          {
            "altText": null,
            "format": "Cart_Tablet",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$cart_tablet_full\$"
          },
          {
            "altText": null,
            "format": "Cart_Desktop",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$cart_desktop_full\$"
          },
          {
            "altText": null,
            "format": "Mini-cart_Mobile",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$minicart_mobile_full\$"
          },
          {
            "altText": null,
            "format": "Mini-cart_Tablet",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$minicart_tablet_full\$"
          },
          {
            "altText": null,
            "format": "Mini-cart_Desktop",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$minicart_desktop_full\$"
          },
          {
            "altText": null,
            "format": "Checkout_Mobile",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$checkout_mobile_full\$"
          },
          {
            "altText": null,
            "format": "Checkout_Tablet",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$checkout_tablet_full\$"
          },
          {
            "altText": null,
            "format": "Checkout_Desktop",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$checkout_desktop_full\$"
          },
          {
            "altText": null,
            "format": "Swatch",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-swatch-lse.jpg?\$swatch\$"
          },
          {
            "altText": null,
            "format": "Find-in-store_Mobile",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$find-in-store_mobile_full\$"
          },
          {
            "altText": null,
            "format": "Find-in-store_Tablet",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$find-in-store_tablet_full\$"
          },
          {
            "altText": null,
            "format": "Find-in-store_Desktop",
            "galleryIndex": null,
            "imageType": "PRIMARY",
            "url": "https://lsco.scene7.com/is/image/lsco/levis/clothing/196270102-front-pdp-lse.jpg?\$find-in-store_desktop_full\$"
          }
        ],
        "maxOrderQuantity": 6,
        "merchantBadge": null,
        "minOrderQuantity": 1,
        "name": "312™ Shaping Slim Jeans",
        "price": {
          "code": null,
          "currencyIso": "EUR",
          "formattedValue": "€70.00",
          "hardPrice": 70,
          "hardPriceFormattedValue": "€70.00",
          "maxQuantity": null,
          "minQuantity": null,
          "priceType": "BUY",
          "regularPrice": 100,
          "regularPriceFormattedValue": "€100.00",
          "softPrice": null,
          "softPriceFormattedValue": null,
          "value": 70
        },
        "stock": {
          "stockLevel": 6,
          "stockLevelStatus": "inStock"
        }
      },
      "quantity": 1,
      "totalPrice": {
        "formattedValue": "€70.00",
        "value": 70
      }
    }
  ],
  "guid": "c75ccec0-8f65-4e4c-9168-185b636b0f02",
  "potentialOrderPromotions": [],
  "potentialProductPromotions": [],
  "subTotal": {
    "formattedValue": "€70.00"
  },
  "totalDiscounts": {
    "formattedValue": "€0.00",
    "value": 0
  },
  "totalItems": 1,
  "totalPrice": {
    "formattedValue": "€70.00",
    "value": 70,
    "currencyIso": "EUR"
  },
  "totalPriceWithTax": {
    "formattedValue": "€70.00"
  },
  "totalTax": {
    "formattedValue": "€0.00"
  },
  "totalUnitCount": 1
}
''';

class CartDataProvider with ChangeNotifier {
  CartData cartData;

  String formattedSize(String code) {
    String size = code.substring(code.length - 4);
    String length = size.substring(0, 2);
    String waist = size.substring(2, 4);
    return '${waist}W X ${length}L';
  }

  Future<void> fetchCart() async {
    // final contentURL =
    //     'https://www.levi.com/omni-cms-gw-exp-api/v1/levicom/online/homepage?country=US&language=en_US&type=homepage_v2&include[]=ref__marketing_layout_v1.ref__marketing_modules_v1';
    // final data = await http.get(contentURL);

    // final Map<String, dynamic> respBody = json.decode(data.body);
    // final respModules = respBody['entries'][0]['ref__marketing_layout_v1'][0]
    //     ['ref__marketing_modules_v1'];

    // final decodedJson = json.decode(contentJson) as Map<String, dynamic>;
    // final decodedJson = json.decode(respModules) as Map<String, dynamic>;
    // _modules = MarketingModules.fromJson({'ref__marketing_modules_v1': respModules}).refMarketingModulesV1;
    cartData = CartData.fromJson(contentJson);

    await Future<void>.value(null);
    print(cartData);
    notifyListeners();
  }

}

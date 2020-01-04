import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/product/product.dart';

class ProductDetails with ChangeNotifier {
  final productQuery = '''
   query product(\$code: ID!) {
    product(code: \$code, locale: "en_US", country: "US" ) {
        altText
        averageOverallRatings
        baseProduct
        classifications {
         code
         features {
           code
           comparable
           description
           featureUnit {
             name
             symbol
             unitType
           }
           featureValues {
             value
           }
           name
           range
           type
         }
         name
       }
        code
        colorGroup
        colorName
        customizable
        description
        findInStoreEligible
        lscoBreadcrumbs {
          categoryCode
          name
          url
        }
        galleryImageList(format: "Mobile") {
     galleryImage {
       altText
       format
       galleryIndex
       imageType
       url
     }
     videos {
       altText
       format
       galleryIndex
       url
     }
   }
        images {
     altText
     format
     galleryIndex
     imageType
     url
   }
        itemType
        maxOrderQuantity
        merchantBadge
        minOrderQuantity
        multidimensional
        name
        noOfRatings
        potentialPromotions {
     code
     couldFireMessages
     couponCode
     description
     enabled
     endDate
     firedMessages
     priority
     productBanner {
       altText
       format
       galleryIndex
       imageType
       url
     }
     promoDetails
     promotionGroup
     promotionType
     restrictions {
       description
       restrictionType
     }
     startDate
     title
   }
        price {
     code
     currencyIso
     formattedValue
     hardPrice
     hardPriceFormattedValue
     maxQuantity
     minQuantity
     priceType
     regularPrice
     regularPriceFormattedValue
     softPrice
     softPriceFormattedValue
     value
   }
        promotionalBadge
        purchasable
        seoMetaData {
            metaDescription
            metaH1
            metaTitle
            robots
        }
        sizeGuide
        soldIndividually
        soldOutForever
        summary
        url
        variantLength
        variantOptions {
     code
     colorName
     displaySizeDescription
     maxOrderQuantity
     minOrderQuantity
     priceData {
       code
       currencyIso
       formattedValue
       hardPrice
       hardPriceFormattedValue
       maxQuantity
       minQuantity
       priceType
       regularPrice
       regularPriceFormattedValue
       softPrice
       softPriceFormattedValue
       value
     }
     stock {
       stockLevel
       stockLevelStatus
     }
     url
     variantOptionQualifiers {
       image {
         altText
         format
         galleryIndex
         imageType
         url
       }
       name
       qualifier
       value
     }
   }
        variantSize
        variantType
        variantWaist
    }
}
  ''';
  Product _product;

  Product get product {
    return _product;
  }

  List<GalleryImage> get mobileGallery {
    List<GalleryImage> reduced = [];
    if(_product != null) {
      for(GalleryImage img in _product.galleryImageList.galleryImage) {
        if (img.format == Format.REGULAR_MOBILE) {
          reduced.add(img);
        }
      }
    }
    return reduced;
  }

  // queryText.setText(searchTermController.text);
  static final HttpLink httpLink = HttpLink(
    // do not use the following URI unless you are sure of what you're doing
    uri: 'https://www.levi.com/webhooks/product',
  );

  final GraphQLClient client = GraphQLClient(
    cache: InMemoryCache(),
    link: httpLink,
  );

  Future<void> fetchProduct(productCode) async {
    _product = null;
    notifyListeners();
    var results = await client.query(QueryOptions(
      documentNode: gql(productQuery),
      variables: {
        'code': productCode,
      },
    ));
    _product = Product.fromJson(results.data['product']);
    print('Product :: $_product');
    notifyListeners();
  }
}

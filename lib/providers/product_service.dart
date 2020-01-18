import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/product/product.dart';

class ProductService with ChangeNotifier {
  final swatchesQuery = '''
  query swatches (\$code: ID!)  {
    swatches(code: \$code, locale:"en", country:"GR") {
        swatches {
            active
            available
            code
            colorName
            imageUrl
            url
            variantsAvailability {
                available
                length
                size
                waist
            }
        }
        errors {
    name
    component
    message
  }
  }
  }
  ''';


  final productQuery = '''
   query product(\$code: ID!) {
    product(code: \$code, locale: "en", country: "GR" ) {
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
  SwatchData _swatches;

  Product get product {
    return _product;
  }

  SwatchData get swatches {
    return _swatches;
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

  Future<SwatchData> _fetchSwatches(productCode) async {
    var results = await client.query(QueryOptions(
      documentNode: gql(swatchesQuery),
      variables: {
        'code': productCode,
      },
    ));
    SwatchData swatches = SwatchData.fromMap(results.data['swatches']);
    return swatches;
  }

  Future<Product> _fetchProductData(productCode) async {
    var results = await client.query(QueryOptions(
      documentNode: gql(productQuery),
      variables: {
        'code': productCode,
      },
    ));
    Product product = Product.fromMap(results.data['product']);
    return product;
  }

  Future<void> fetchProduct(productCode) async {
    _product = null;
    notifyListeners();
    await Future.wait([_fetchProductData(productCode), _fetchSwatches(productCode)]).then((List<dynamic> results) {
      results.forEach((result) {
        if(result is Product) {
          _product = result;
        }
        if(result is SwatchData) {
          _swatches = result;
        }
        print('Product :: $_product');
        print('Product :: $_swatches');
      });
    });
    notifyListeners();
  }
}

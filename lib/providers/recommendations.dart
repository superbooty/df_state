import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../providers/product.dart';

class Recommendations with ChangeNotifier {

  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }
  
  Future<void> getRecommendationProducts() async {
    // this URL is a production URL do not use unless you're sure of what you're doing
    final List<Product> recommended = [];
    /*
    final recommendationsURL = 'https://api.levi-site.com/homereco/homerecommendations';
    final data = await http.post(recommendationsURL, body: {
      'anonId': '',
      'location': 'California',
      'device': 'Desktop',
      'CSRFToken':''
    });
    final respBody = json.decode(data.body) as Map<String, dynamic>;
    */
    final respBody = jsonDecode('''{ "final_recos": { "cdhrecommendations": [ { "placement": "homePage", "recommendedProducts": [ { "attribute.colour": "Yokohama Nights", "brand": "Levi", "features_apparel": "", "hardmarkprice": 0, "id": "188810052", "image_URL": "https://lsco.scene7.com/is/image/lsco/Levis/clothing/045111150-front-pdp.jpg?\$grid_desktop_bottoms\$", "link_URL": "https://www.levi.com/US/en_US/clothing/men/jeans/511-slim-fit-mens-jeans/p/045111150", "name": "AB 511 Slim Fit Men's Jeans", "regularprice": 69.5, "softmarkprice": 59.99 }, { "attribute.colour": "Los Angeles Sun", "brand": "Levi", "features_apparel": "Levi’s® Sculpt", "hardmarkprice": 0, "id": "845580001", "image_URL": "https://lsco.scene7.com/is/image/lsco/levis/clothing/188820244-front-pdp.jpg?\$grid_desktop_bottoms\$", "link_URL": "https://www.levi.com/US/en_US/apparel/clothing/bottoms/721-high-rise-skinny-womens-jeans/p/188820244", "name": "Skinny Taper Jeans", "regularprice": 98.0, "softmarkprice": 0 }, { "attribute.colour": "Mineral Black", "brand": "Levi", "features_apparel": "Custom", "hardmarkprice": 0, "id": "856410000", "image_URL": "https://lsco.scene7.com/is/image/lsco/levis/clothing/577880001-front-sw-pdp.jpg?\$grid_desktop_full\$", "link_URL": "https://www.levi.com/US/en_US/apparel/clothing/tops/mens-blank-artist-tee-shirt/p/577880001", "name": "Levis Original Housemark V-neck Tee", "regularprice": 25.0, "softmarkprice": 0 }, { "attribute.colour": "Radio Starr Stretch", "brand": "Levi", "features_apparel": "", "hardmarkprice": 0, "id": "167860001", "image_URL": "https://lsco.scene7.com/is/image/lsco/Levis/clothing/589300010-front-pdp.jpg?\$grid_desktop_full\$", "link_URL": "https://www.levi.com/US/en_US/clothing/women/shirts-blouses-tops/ultimate-western-shirt/p/589300010", "name": "Ultimate Western Shirt", "regularprice": 59.5, "softmarkprice": 49.99 }, { "attribute.colour": "Graphite", "brand": "Levi", "features_apparel": "", "hardmarkprice": 0, "id": "295070049", "image_URL": "https://lsco.scene7.com/is/image/lsco/Levis/clothing/295070049-front-pdp.jpg?\$grid_desktop_bottoms\$", "link_URL": "https://www.levi.com/US/en_US/clothing/men/pants/502-taper-fit-pants/p/295070049", "name": "502™ Taper Fit Pants", "regularprice": 69.5, "softmarkprice": 59.99 }, { "attribute.colour": "Shiraz", "brand": "Levi", "features_apparel": "Corduroy", "hardmarkprice": 0, "id": "797550009", "image_URL": "https://lsco.scene7.com/is/image/lsco/Levis/clothing/797550009-front-pdp.jpg?\$grid_desktop_bottoms\$", "link_URL": "https://www.levi.com/US/en_US/apparel/clothing/bottoms/ribcage-straight-ankle-corduroy-pants/p/797550009", "name": "Ribcage Straight Ankle Corduroy Pants", "regularprice": 98.0, "softmarkprice": 0 }, { "attribute.colour": "Grey", "brand": "Levi", "features_apparel": "Sherpa", "hardmarkprice": 0, "id": "791290000", "image_URL": "https://lsco.scene7.com/is/image/lsco/levis/clothing/791290000-front-pdp.jpg?\$grid_desktop_full\$", "link_URL": "https://www.levi.com/US/en_US/apparel/clothing/tops/vintage-fit-sherpa-trucker-jacket/p/791290000", "name": "Vintage Fit Sherpa Trucker Jacket", "regularprice": 128.0, "softmarkprice": 0 }, { "attribute.colour": "Strangerways", "brand": "Levi", "features_apparel": "Sherpa", "hardmarkprice": 0, "id": "361370026", "image_URL": "https://lsco.scene7.com/is/image/lsco/levis/clothing/361370026-front-pdp.jpg?\$grid_desktop_full\$", "link_URL": "https://www.levi.com/US/en_US/apparel/clothing/tops/ex-boyfriend-sherpa-trucker-jacket/p/361370026", "name": "Ex-Boyfriend Sherpa Trucker Jacket", "regularprice": 128.0, "softmarkprice": 0 }, { "attribute.colour": "Indigo Sky", "brand": "Levi", "features_apparel": "Custom", "hardmarkprice": 0, "id": "563270089", "image_URL": "https://lsco.scene7.com/is/image/lsco/Levis/clothing/563270089-front-pdp.jpg?\$grid_desktop_bottoms\$", "link_URL": "https://www.levi.com/US/en_US/apparel/clothing/bottoms/501-high-rise-shorts/p/563270089", "name": "501® High Rise Shorts", "regularprice": 98.0, "softmarkprice": 0 }, { "attribute.colour": "Indigo", "brand": "Levi", "features_apparel": "", "hardmarkprice": 0, "id": "561760000", "image_URL": "https://lsco.scene7.com/is/image/lsco/levis/clothing/561760000-front-pdp.jpg?\$grid_desktop_full\$", "link_URL": "https://www.levi.com/US/en_US/clothing/men/sweaters-sweatshirts/levi’s-chest-logo-crewneck-sweatshirt/p/561760000", "name": "Levi’s® Chest Logo Crewneck Sweatshirt", "regularprice": 59.5, "softmarkprice": 0 } ], "title": "BESTSELLERS WE RECOMMEND" } ] }, "id": "3c675fe0-91d5-4d0e-937d-bf944cb9a83c[FORM-URLENCODED]" }''');
    Map<String, dynamic> productsWrapper =
          respBody["final_recos"]["cdhrecommendations"][0];
    List<dynamic> products = productsWrapper["recommendedProducts"];
    for (var product in products) {
      recommended.add(Product(
            name: product['name'].toString(),
            price: {'formattedValue': '', 'value': product['regularprice']},
            images: [{'format': 'Grid_Mobile',
              'imageType': 'PRIMARY',
              'url': product['image_URL']}],
            code: product['id'])
      );
    }
    _items = recommended;
    notifyListeners();
  }
}
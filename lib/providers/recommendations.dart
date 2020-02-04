import 'dart:convert';
import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;

import '../providers/product.dart';


class Recommendations with ChangeNotifier {

  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }
  
  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle.loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
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
    final respBody = await parseJsonFromAssets('assets/recommendations-list.json');
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
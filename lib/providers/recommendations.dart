import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../providers/product.dart';


class Recommendations with ChangeNotifier {

  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }
  
  Future<void> getRecommendationProducts() async {
    final recommendationsURL = 'https://api.levi-site.com/homereco/homerecommendations';
    final List<Product> recommended = [];
    final data = await http.post(recommendationsURL, body: {
      'anonId': '',
      'location': 'California',
      'device': 'Desktop',
      'CSRFToken':''
    });
    final respBody =
              json.decode(data.body) as Map<String, dynamic>;
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
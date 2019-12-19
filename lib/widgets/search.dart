// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';


// import '../widgets/top_sellers.dart';
import '../widgets/recommended_items.dart';
import '../providers/products.dart';
import '../providers/product.dart';

import '../screens/products_overview_screen.dart';
// import '../providers/query_text.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchTermController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RecommendedItems(),
        Text(
          'RECOMMENDED FOR YOU',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 100),
        Container(
          padding: EdgeInsets.all(15),
          child: TextField(
            autocorrect: true,
            controller: searchTermController,
            decoration: InputDecoration(
              hintText: 'Search',
              icon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      ProductsOverviewScreen.routeName,
                      (route) => route.isCurrent &&
                              route.settings.name ==
                                  ProductsOverviewScreen.routeName
                          ? false
                          : true);
                  print('Searching for');
                  products.setItems([]);

                  final query = '''
                    query search(\$query: String!) {
                      search(
                        query: \$query
                        country: "CA"
                        locale: "en_CA"
                        sort: "relevance"
                        currentPage: 0
                        pageSize: 20
                      ) {
                          products {
                            name
                            code
                            price {
                              formattedValue
                              value
                            }
                            images {
                                format
                                imageType
                                url
                              }
                          }
                      }
                  }
                  ''';
                  // queryText.setText(searchTermController.text);
                  final HttpLink httpLink = HttpLink(
                    uri: 'https://www.levi.com/webhooks/search',
                  );

                  GraphQLClient client = GraphQLClient(
                    cache: InMemoryCache(),
                    link: httpLink,
                  );

                  //var productList;
                  var results = await client.query(QueryOptions(
                    documentNode: gql(query),
                    variables: {
                      'query': searchTermController.text.isNotEmpty 
                        ? searchTermController.text
                        : '',
                    },
                  ));

                  List<dynamic> productList =
                      results.data['search']['products'];
                  final List<Product> generated = [];
                  for (var product in productList) {
                    generated.add(Product(
                        name: product['name'],
                        price: product['price'],
                        images: product['images'],
                        code: product['code']));
                  }
                  print('Generated :: $generated');
                  products.setItems(generated);
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

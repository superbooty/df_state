// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

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
    return Container(
      padding: EdgeInsets.all(15),
      child: TextField(
        autocorrect: true,
        controller: searchTermController,
        decoration: InputDecoration(
          hintText: 'Search',
          icon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              print('Searching for');
              products.setItems([]);

              final query = '''
                    query search(\$query: String!) {
                      search(
                        query: \$query
                        country: "GR"
                        locale: "en"
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
                // do not use the following URI unless you are sure of what you're doing
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

              List<dynamic> productList = results.data['search']['products'];
              final List<Product> generated = [];
              for (var product in productList) {
                generated.add(Product(
                    name: product['name'],
                    price: product['price'],
                    images: product['images'],
                    code: product['code']));
              }
              // print('Generated :: $generated');
              products.setItems(generated);
              Navigator.of(context).pushNamedAndRemoveUntil(
                  ProductsOverviewScreen.routeName,
                  (route) => route.isCurrent &&
                          route.settings.name ==
                              ProductsOverviewScreen.routeName
                      ? false
                      : true);
            },
          ),
        ),
      ),
    );
  }
}

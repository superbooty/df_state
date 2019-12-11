import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final _query = '''
    query{
      search(
        query: "blue jeans"
        country: "CA"
        locale: "en_CA"
        sort: "relevance"
        currentPage: 0
        pageSize: 20
      ) {
          products {
            name
            price {
              currencyIso
              formattedValue
              hardPrice
              hardPriceFormattedValue
              priceType
              regularPrice
              regularPriceFormattedValue
              value
            }
            url
          }
      }
    } 
  ''';

  static final HttpLink httpLink = HttpLink(
    uri: 'https://www.levi.com/webhooks/search',
  );

  final ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink,
    ),
  );
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final searchTermController = TextEditingController();
  String _response = '';

  void _updateResponse(data) {
    var self = this;
    setState(() => self._response = data);
    ;
  }

  Future<void> _fetchData() async {
    _updateResponse('Fetching Data...');

    var resp = await http.get(
        'https://www.levi.com/rest/v2/leviUSSite/products/005050216/swatchdata?fields=FULL&lang=en_US');
    if (resp.statusCode == 200) {
      _updateResponse('Done :: ${resp.statusCode}');
    } else {
      _updateResponse('Fetching Data...Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          autocorrect: true,
          decoration: InputDecoration(
            hintText: 'Search',
            icon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _fetchData();
                print('Searching for $searchTermController.text');
              },
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        _response.isNotEmpty
          //? Text('$_response')
            ? GraphQLProvider(
              client: widget.client,
              child: Query(
                options: QueryOptions(
                  document: widget
                      ._query, // this is the query string you just created

                  pollInterval: 10,
                ),
                // Just like in apollo refetch() could be used to manually trigger a refetch
                // while fetchMore() can be used for pagination purpose
                builder: (QueryResult result,
                    {VoidCallback refetch, FetchMore fetchMore}) {
                  if (result.errors != null) {
                    return Text(result.errors.toString());
                  }

                  if (result.loading) {
                    return Text('Loading');
                  }
                  return Text(
                    'GraphQL like a Pro'
                  );
                },
              ))
            : Text('No Response')
      ],
    );
  }
}

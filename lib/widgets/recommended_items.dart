import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/recommendations.dart';

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Recommended for you...');
    return Container(
      height: 275,
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        future: Provider.of<Recommendations>(context, listen: false)
            .getRecommendationProducts(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<Recommendations>(
                builder: (ctx, recommendations, child) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendations.items.length,
                  // this will create the scrollable horizontal list of recommended items
                  itemBuilder: (ctx, i) => Card(
                    child: Container(
                      width: 150,
                      //padding: EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // Wrap the Image in a Gesture detector to make it clickable
                          GestureDetector(
                            child: Image.network(
                              recommendations.items[i].images[0]['url'],
                              height: 180,
                            ),
                            // add the tap event handler
                            onTap: () {
                              // route to product details page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      // pass the product to the detail screen when route triggers
                                      ProductDetailScreen(
                                          product: recommendations.items[i]),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              recommendations.items[i].name,
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$${recommendations.items[i].price['value'].toStringAsFixed(2)}',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0XFFc41130),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
    // https://api.levi-site.com/homereco/homerecommendations
    // https://www.levi.com/US/en_US/_s/user-uid
  }
}

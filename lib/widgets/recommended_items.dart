import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  itemBuilder: (ctx, i) => Card(
                    child: Container(
                      width: 145,
                      //padding: EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            recommendations.items[i].images[0]['url'],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              recommendations.items[i].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            '\$${recommendations.items[i].price['value'].toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.red,
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

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/recommendations.dart';

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Recommended for you...');
    return FutureBuilder(
          future: Provider.of<Recommendations>(context).getRecommendationProducts(),
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
                      itemCount: recommendations.items.length,
                      itemBuilder: (ctx, i) => Container(
                        child: Text('${recommendations.items[i].name}'),
                      )
                    ),
              );
            }
          }
        },

    );
    // https://api.levi-site.com/homereco/homerecommendations
    // https://www.levi.com/US/en_US/_s/user-uid
  }
}

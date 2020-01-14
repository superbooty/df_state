import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cms_content.dart';
import '../widgets/popup_menu.dart';
import '../widgets/cms/cms_home.dart';

class Home extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/home';

  final String appBarText = 'Sweet Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: FutureBuilder(
          future:
              Provider.of<CmsContent>(context, listen: false).fetchCMSContent(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return CMSHome();
            }
          }),
    );
  }
}

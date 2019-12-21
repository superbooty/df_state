import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/marketing_modules.dart';
import 'package:provider/provider.dart';

import '../providers/cms_content.dart';
import '../widgets/popup_menu.dart';
import '../widgets/cms/cms_home.dart';


class Home extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/home';

  String appBarText = 'Sweet Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder (
          future: getAppbarText(),
          builder: (ctx, dataSnapshot) {
            return Text(appBarText);
          }
        ),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<CmsContent>(context, listen: false)
              .fetchCMSContent(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return CMSHome();
            }
          }),
    );
  }

  buildLinks(Mb module) {
    if (module.mbHeroV1.overlaidContent.ctaLinks.length > 0) {
      for (CtaLink ctaLink in module.mbHeroV1.overlaidContent.ctaLinks) {}
    }
  }

  Future<void> getAppbarText() async {
    this.appBarText = 'Sweet Home';
    return await Future<void>.value(null);
  }
}

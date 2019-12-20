import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/marketing_modules.dart';
import 'package:provider/provider.dart';

import '../providers/cms_content.dart';
import '../widgets/popup_menu.dart';

class Home extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sweet Home'),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<CmsContent>(context, listen: false)
              .fetchCMSMarketingModules(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Consumer<CmsContent>(
                builder: (ctx, contentModules, child) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contentModules.modules.length,
                  itemBuilder: (ctx, i) => contentModules
                              .moduleContent[i].mbHeroV1 !=
                          null
                      ? Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.9),
                                      BlendMode.dstATop),
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    contentModules.moduleContent[i].mbHeroV1
                                        .bgMedia.bgImageMobile.url,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Opacity(
                                opacity: .30,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.black54,
                                      Colors.black,
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                            contentModules.moduleContent[i].mbHeroV1
                                        .overlaidContent !=
                                    null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Text(
                                                contentModules
                                                    .moduleContent[i]
                                                    .mbHeroV1
                                                    .overlaidContent
                                                    .headline
                                                    .headlineText,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 42,
                                                  letterSpacing: 5,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 100,
                                              width: 200,
                                              child: ListView(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                children: contentModules
                                                    .moduleContent[i]
                                                    .mbHeroV1
                                                    .overlaidContent
                                                    .ctaLinks
                                                    .map((link) {
                                                  return FlatButton(
                                                    color: Colors.white
                                                        .withOpacity(.9),
                                                    textColor: Colors.black54,
                                                    disabledColor: Colors.grey,
                                                    disabledTextColor:
                                                        Colors.black,
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    splashColor:
                                                        Colors.blueAccent,
                                                    onPressed: () {
                                                      /*...*/
                                                    },
                                                    child: Text(
                                                      link.linkText,
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        )
                      : Container(),
                ),
              );
            }
          }),
    );
  }

  buildLinks(Mb module) {
    if (module.mbHeroV1.overlaidContent.ctaLinks.length > 0) {
      for (CtaLink ctaLink in module.mbHeroV1.overlaidContent.ctaLinks) {}
    }
  }
}

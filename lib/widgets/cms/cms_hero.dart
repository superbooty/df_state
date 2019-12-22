import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cms/marketing_modules.dart';

class CMSHero extends StatelessWidget {
  const CMSHero({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cmsHero = Provider.of<MbHeroV1>(context, listen: false);
    return Container(
      child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop),
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    cmsHero.bgMedia
                        .bgImageMobile.url,
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
            cmsHero.overlaidContent !=
                    null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Center(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    cmsHero.overlaidContent
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
                                  height: 30,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    cmsHero
                                        .overlaidContent
                                        .subcopy,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: cmsHero.overlaidContent.ctaLinks
                                        .map((link) {
                                      return Container(
                                        margin: EdgeInsets.all(5),
                                        width: MediaQuery.of(context).size.width * .6,
                                        child: FlatButton(
                                          color: Colors.white,
                                          textColor: Colors.black,
                                          padding: EdgeInsets.all(15.0),
                                          onPressed: () {
                                            /*...*/
                                          },
                                          child: Text(
                                            link.linkText,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(), // must call to List to return elements as a list
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
    );
  }
}

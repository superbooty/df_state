import 'package:flutter/material.dart';

import '../widgets/popup_menu.dart';

class Cart extends StatelessWidget {
  static const routeName = '/cart';

  final String appBarText = 'Cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appBarText),
          actions: <Widget>[
            MyPopupMenu(),
          ],
        ),
        // body: Row(
        //   children: <Widget>[
        //     Expanded(
        //       flex: 2,
        //       child: Container(
        //         child: Image.network(
        //           'https://lsco.scene7.com/is/image/lsco/levis/clothing/005010193-front-pdp.jpg?\$grid_mobile_bottoms\$',
        //           height: 120.0
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 3,
        //       child: Container(

        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Container(

        //       ),
        //     ),
        //   ],
        // )
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (ctx, i) => Card(
                    child: Container(
                  height: 130,
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: <Widget>[
                      Image.network(
                          'https://lsco.scene7.com/is/image/lsco/levis/clothing/005010193-front-pdp.jpg?\$grid_mobile_bottoms\$',
                          height: 120.0),
                      SizedBox(width: 15.0),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Favorite pair of jeans',
                                maxLines: 3,
                                style: TextStyle(
                                  fontFamily: 'Interstate',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    '\$100.00',
                                    style: TextStyle(
                                      fontFamily: 'Interstate',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Color: sexy blue',
                                    style: TextStyle(
                                      fontFamily: 'Interstate',
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Size: 32WX30L',
                                    style: TextStyle(
                                      fontFamily: 'Interstate',
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'QTY 1',
                                    style: TextStyle(
                                      fontFamily: 'Interstate',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        );
  }
}

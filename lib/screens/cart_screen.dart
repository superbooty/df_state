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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (ctx, i) => Card(
                child: CartListItem(
                  image: Image.network(
                    'https://lsco.scene7.com/is/image/lsco/levis/clothing/005010193-front-pdp.jpg?\$grid_mobile_bottoms\$',
                      height: 120.0,
                      fit: BoxFit.cover,
                  ),
                  colorName: 'Nothing compares to blue',
                  productName: 'My Favorite Jeans',
                  price: '\$119.98',
                  displayableSize: '32W X 30L',
                  qty: '1',
                )
              ),
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

class _CartItemDescription extends StatelessWidget {
  _CartItemDescription({
    Key key,
    this.productName,
    this.price,
    this.displayableSize,
    this.colorName,
    this.qty,
  }) : super(key: key);

  final String productName;
  final String price;
  final String displayableSize;
  final String colorName;
  final String qty;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$productName',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '$colorName',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$displayableSize',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '$price',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFFc41130),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'QTY · $qty',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CartListItem extends StatelessWidget {
  CartListItem({
    Key key,
    this.image,
    this.productName,
    this.price,
    this.colorName,
    this.displayableSize,
    this.qty,
  }) : super(key: key);

  final Widget image;
  final String productName;
  final String price;
  final String colorName;
  final String displayableSize;
  final String qty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: image,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _CartItemDescription(
                  productName: productName,
                  colorName: colorName,
                  displayableSize: displayableSize,
                  qty: qty,
                  price: price,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
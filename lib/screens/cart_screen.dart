import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart/cart_data.dart' as cartData;
import '../providers/cart_data_provider.dart';
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
      body: FutureBuilder(
          future:
              Provider.of<CartDataProvider>(context, listen: false).fetchCart(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Consumer<CartDataProvider>(
                builder: (ctx, provider, child) => Container(
                  //height: 500,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount: provider.cartData.entries.length,
                            itemBuilder: (ctx, i) {
                              cartData.Entry cartEntry =
                                  provider.cartData.entries[i];
                              return Card(
                                child: CartListItem(
                                  image: Image.network(
                                    cartEntry.product.images[0].url,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                  colorName: '${cartEntry.product.colorName}',
                                  productName: '${cartEntry.product.name}',
                                  price:
                                      '${cartEntry.product.price.formattedValue}',
                                  displayableSize: provider
                                      .formattedSize(cartEntry.product.code),
                                  qty: '1',
                                ),
                              );
                            },
                          ),
                        ),
                        Divider(
                          thickness: .5,
                          color: Colors.black54,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                SizedBox(height: 10),
                                _CartCalcRow(
                                  data:
                                      provider.cartData.subTotal.formattedValue,
                                  label: 'SUBTOTAL',
                                ),
                                SizedBox(height: 30),
                                _CartCalcRow(
                                  data: provider
                                      .cartData.totalDiscounts.formattedValue,
                                  label: 'DISCOUNT',
                                ),
                                SizedBox(height: 30),
                                _CartCalcRow(
                                  data: provider.cartData.deliveryCost != null
                                      ? provider
                                          .cartData.deliveryCost.formattedValue
                                      : '\$0.00',
                                  label: 'SHIPPING',
                                ),
                                SizedBox(height: 30),
                                _CartCalcRow(
                                  data:
                                      provider.cartData.totalTax.formattedValue,
                                  label: 'ESTIMATED TAX',
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  thickness: .5,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}

class _CartCalcRow extends StatelessWidget {
  _CartCalcRow({
    Key key,
    @required this.label,
    @required this.data,
    this.dataDecoration,
  }) : super(key: key);

  final String label;
  final String data;
  final TextDecoration dataDecoration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('$label',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )),
        Text(
          '$data',
          textAlign: TextAlign.right,
          style: TextStyle(
            decoration: dataDecoration != null ? dataDecoration : null,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
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
                'Color $colorName',
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
                'Size $displayableSize',
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

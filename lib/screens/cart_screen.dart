import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/cart/cart_data.dart' as cartData;
import 'package:provider/provider.dart';

import '../models/cart/cart_data.dart' as cartData;
import '../providers/cart_data_provider.dart';
import '../widgets/popup_menu.dart';

class Cart extends StatelessWidget {
  static const routeName = '/cart';

  final String appBarText = 'Cart';

  Cart({
    Key key,
  }) : super(key: key) {}

  final TextEditingController applyPromoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CartDataProvider cdp =
        Provider.of<CartDataProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      body: FutureBuilder(
        future: cdp.fetchCart(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Consumer<CartDataProvider>(
              builder: (ctx, provider, child) => SingleChildScrollView(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
                child: Container(
                  child: Column(
                    //shrinkWrap: true,
                    children: <Widget>[
                      ListView.separated(
                        separatorBuilder: (ctx, si) => Divider(
                          color: Colors.grey[400],
                          thickness: 1,
                          indent: 140,
                        ),
                        padding: EdgeInsets.all(0),
                        itemCount: provider.cartData.entries.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, i) {
                          cartData.Entry cartEntry =
                              provider.cartData.entries[i];
                          return CartListItem(
                            image: Image.network(
                              cartEntry.product.images[0].url,
                              height: 120.0,
                              fit: BoxFit.cover,
                            ),
                            colorName: '${cartEntry.product.colorName}',
                            productName: '${cartEntry.product.name}',
                            price: '${cartEntry.product.price.formattedValue}',
                            displayableSize: cartEntry.product.baseOptions[0]
                                .selected.displaySizeDescription,
                            qty: '1',
                          );
                        },
                      ),
                      _ExpandableFormTile(
                        message: 'HAVE A PROMOTION CODE?',
                        iconLabel: 'Add Code',
                        items: <Widget>[
                          SizedBox(
                            width: 250,
                            child: TextField(
                              // controller: applyPromoController,
                              onSubmitted: (value) {
                                cdp.setPromoText(value);
                              },
                              decoration: InputDecoration(
                                  labelText: 'Enter Promo Code',
                                  alignLabelWithHint: true,
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              provider.promoError ? 'Invalid Promo Code' : '',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0XFFc41130),
                              ),
                            ),
                          ),
                          _ActionButton(
                            action: () => provider.applyPromo(cdp.promoText),
                            activate: provider.promoText.isNotEmpty,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      _CartCalcRow(
                        data: provider.cartData.subTotal.formattedValue,
                        label: 'SUBTOTAL',
                      ),
                      SizedBox(height: 20),
                      _CartCalcRow(
                        data: provider.cartData.totalDiscounts.formattedValue,
                        label: 'DISCOUNT',
                      ),
                      SizedBox(height: 20),
                      _CartCalcRow(
                        data: provider.cartData.deliveryCost != null
                            ? provider.cartData.deliveryCost.formattedValue
                            : '\$0.00',
                        label: 'SHIPPING',
                      ),
                      SizedBox(height: 20),
                      _CartCalcRow(
                        data: provider.cartData.totalTax.formattedValue,
                        label: 'ESTIMATED TAX',
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 1,
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 15),
                      _CartCalcRow(
                        data: provider.cartData.totalPrice.formattedValue,
                        label: 'TOTAL',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  _ActionButton({
    Key key,
    this.action,
    this.activate,
  }) : super(key: key);

  final Function action;
  final bool activate;

  @override
  __ActionButtonState createState() => __ActionButtonState();
}

class __ActionButtonState extends State<_ActionButton> {
  bool processing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonTheme(
          minWidth: 250,
          height: 44,
          child: FlatButton(
            color: widget.activate ? Colors.black : Colors.grey,
            textColor: Colors.white,
            //padding: EdgeInsets.all(15.0),
            onPressed: () async {
              if(widget.activate) {
                setState(() {
                  processing = true;
                });
                await widget.action();
              }
              setState(() {
                processing = false;
              });
            },
            child: processing
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    'APPLY',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class _ExpandableFormTile extends StatefulWidget {
  _ExpandableFormTile({
    Key key,
    @required this.message,
    @required this.iconLabel,
    this.items = const <Widget>[],
  }) : super(key: key);

  final String message;
  final String iconLabel;
  final List<Widget> items;

  final TextStyle _topStyle = TextStyle(
    color: Colors.grey[700],
  );

  @override
  __ExpandableFormTileState createState() => __ExpandableFormTileState();
}

class __ExpandableFormTileState extends State<_ExpandableFormTile> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    print("building....");
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
              print('EXPANDED ::  $expanded');
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 15, top: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Text(
                      widget.message,
                      style: widget._topStyle,
                    ),
                  ),
                  Text(
                    widget.iconLabel,
                    style: widget._topStyle,
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    !expanded ? Icons.add : Icons.remove,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            height: !expanded ? 0.00 : 150,
            duration: Duration(milliseconds: 300),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(0),
              child: Column(
                children: widget.items != null
                    ? widget.items.map<Widget>((item) {
                        return item;
                      }).toList()
                    : SizedBox(),
              ),
            ),
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

class _CartCalcRow extends StatelessWidget {
  _CartCalcRow({
    Key key,
    @required this.label,
    @required this.data,
    this.labelStyle,
    this.dataStyle,
    this.dataDecoration,
  }) : super(key: key);

  final String label;
  final String data;
  final TextStyle labelStyle;
  final TextStyle dataStyle;
  final TextDecoration dataDecoration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '$label',
          textAlign: TextAlign.right,
          style: labelStyle == null
              ? TextStyle(
                  fontFamily: 'Interstate',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )
              : labelStyle,
        ),
        Text(
          '$data',
          textAlign: TextAlign.right,
          style: dataStyle == null
              ? TextStyle(
                  decoration: dataDecoration != null ? dataDecoration : null,
                  fontFamily: 'Interstate',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )
              : dataStyle,
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
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                'Color $colorName',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
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
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 5,
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
                        color: Colors.black,
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
        height: 115,
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

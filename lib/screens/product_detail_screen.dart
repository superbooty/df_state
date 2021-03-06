import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/buying_options.dart';
import '../utils/text_utils.dart';
import '../widgets/forms/size.dart';
import '../providers/product_service.dart';
import '../models/product/product.dart';
import '../providers/product.dart' as providerProduct;
import '../widgets/popup_menu.dart';

enum Dimension {
  Waist,
  Length,
  Size,
}

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  final providerProduct.Product product;

  // In the constructor, require a Todo.
  ProductDetailScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Provider.of<CartProduct>(context).setCode(product.code);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: <Widget>[
          MyPopupMenu(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Add to Cart'),
        icon: Icon(Icons.add_shopping_cart),
        backgroundColor: Color(0XFFc41130),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: Consumer<ProductService>(
        builder: (ctx, data, _) {
          if (data.product == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ProductDetails(data.product, data.swatches);
          }
        },
      ),
    );
  }
}

class OptionsButton extends FlatButton with MaterialButtonWithIconMixin {
  OptionsButton({
    Key key,
    VoidCallback onPressed,
    VoidCallback onLongPress,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior = Clip.none,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    Widget icon,
    @required Widget label,
  })  : assert(label != null),
        assert(clipBehavior != null),
        assert(autofocus != null),
        super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHighlightChanged: onHighlightChanged,
          textTheme: textTheme,
          textColor: textColor,
          disabledTextColor: disabledTextColor,
          color: color,
          disabledColor: disabledColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          colorBrightness: colorBrightness,
          padding: padding,
          shape: shape,
          clipBehavior: clipBehavior,
          focusNode: focusNode,
          autofocus: autofocus,
          materialTapTargetSize: materialTapTargetSize,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              label,
              icon != null ? const SizedBox(width: 5.0) : SizedBox(),
              icon != null ? icon : SizedBox(width: 5.0),
            ],
          ),
        );
}

class ProductDetails extends StatelessWidget {
  final Product product;
  final SwatchData swatches;

  const ProductDetails(
    this.product,
    this.swatches, {
    Key key,
  }) : super(key: key);

  selectSizeAndQty(BuildContext ctx, int tabIndex) {
    SizeSelector selector;
    if (product.variantSize != null) {
      selector = SizeSelector.forSizes(tabIndex, swatches.swatches,
          sizes: product.variantSize);
    } else {
      selector = SizeSelector.forWasitLength(
        tabIndex,
        swatches.swatches,
        waist: product.variantWaist,
        length: product.variantLength,
      );
    }
    showModalBottomSheet(
      elevation: 3,
      context: ctx,
      builder: (ctx) {
        return selector;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<BuyingOptions>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CarouselSlider(
            //height: mediaQuery.size.height * .5,
            enlargeCenterPage: true,
            viewportFraction: .9,
            aspectRatio: .8,
            items: product.mobileGallery.map(
              (image) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 4, right: 4),
                  child: GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        image.url,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      print('Tapped');
                    },
                  ),
                );
              },
            ).toList(),
          ),
          SizedBox(height: 10),
          Text(
            product.price.formattedValue,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              color: Color(0XFFc41130),
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(
            color: Colors.grey[600],
          ),
          Text(
            product.name,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            TextUtils.removeAllHtmlTags(product.description),
            style: TextStyle(
              //fontFamily: 'Quicksand',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Color: ${product.colorName}',
            style: TextStyle(
              //fontFamily: 'Quicksand',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey[700],
            height: 5,
          ),
          Consumer<BuyingOptions>(
            builder: (context, buyOptions, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  OptionsButton(
                    // color: Colors.black,
                    textColor: Colors.grey[600],
                    padding: EdgeInsets.only(left: 0),
                    onPressed: () {
                      selectSizeAndQty(context, 0);
                    },
                    label: Text(
                      '${buyOptions.sizeLabel}',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ),
                  OptionsButton(
                    textColor: Colors.grey[600],
                    onPressed: () {
                      selectSizeAndQty(context, 1);
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    label: Text(
                      buyOptions.qty > 0 ? 'QTY ${buyOptions.qty}' : 'QTY',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          ProductRating(
              rating: product.averageOverallRatings != null
                  ? product.averageOverallRatings.toDouble()
                  : 0.0),
        ],
      ),
    );
  }
}

class ProductRating extends StatelessWidget {
  final double rating;

  const ProductRating({
    @required this.rating,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 200,
      height: 40,
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          if (i + 1 < rating) {
            return Icon(Icons.star, color: const Color(0XFFc41130));
          } else if (i < rating && i + 1 > rating) {
            return Icon(Icons.star_half, color: const Color(0XFFc41130));
          } else {
            return Icon(Icons.star_border, color: const Color(0XFFc41130));
          }
        },
      ),
    );
  }
}

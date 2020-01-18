import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/labeled_radio.dart';
import '../../providers/buying_options.dart';
import '../../models/product/product.dart';

class SizeSelector extends StatefulWidget {
  final List<String> waist;
  final List<String> length;
  final List<String> sizes;
  final List<Swatch> swatches;
  final int tabIndex;

  SizeSelector.forWasitLength(this.tabIndex, this.swatches,
      {@required this.waist, @required this.length, this.sizes = const []});

  SizeSelector.forSizes(this.tabIndex, this.swatches,
      {@required this.sizes, this.waist = const [], this.length = const []});

  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  
  @override
  Widget build(BuildContext context) {
    BuyingOptions buyOptions = Provider.of<BuyingOptions>(context);

    return DefaultTabController(
      length: 2,
      initialIndex: widget.tabIndex,
      child: Container(
        //height: 280,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                labelColor: Colors.grey[800],
                indicatorColor: Color(0XFFc41130),
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  Tab(text: "Select Size"),
                  Tab(text: "Select Qty"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: TabBarView(
                  children: [
                    Container(
                      height: 600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          widget.sizes.length > 0
                              ? SingleFactorSize(widget.swatches,
                                  sizes: widget.sizes,
                                )
                              : MultiFactorSize(widget.swatches,
                                  waist: widget.waist,
                                  length: widget.length,
                                ),
                          //
                          SizedBox(height: 21),
                          FlatButton(
                            color: Colors.black,
                            // shape: Border.all(
                            //   color: Colors.grey[600],
                            //   width: .75,
                            // ),
                            textColor: Colors.black,
                            padding: EdgeInsets.all(12.0),
                            onPressed: () {
                              String sizeString = 'Size';
                              if (widget.sizes != null && widget.sizes.length > 0) {
                                sizeString = '${widget.sizes[buyOptions.selectedSizeIndex]}';
                              } else {
                                sizeString = '${widget.waist[buyOptions.selectedWaistIndex]} X ${widget.length[buyOptions.selectedLengthIndex]}';
                              }
                              buyOptions.setSizeLabel(sizeString);
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Update',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // QTY Selector
                    Container(
                      child:
                          Text('Someday you will be able to select a quantity'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MultiFactorSize extends StatelessWidget {
  final List<String> waist;
  final List<String> length;
  final List<Swatch> swatches;

  MultiFactorSize(this.swatches, {this.waist, this.length});

  checkCanEnableWaist(int i) {
    return true;
  }

  checkCanEnableLength(int i) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    BuyingOptions bo = Provider.of<BuyingOptions>(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          // margin: const EdgeInsets.all(5),
          // color: Colors.grey,
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            'WAIST',
            style: TextStyle(
              fontFamily: 'Quicksand',
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.grey[300],
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          child: Consumer<BuyingOptions>(
            builder: (ctx, buyOptions, _) => ListView.builder(
              controller: ScrollController(
                initialScrollOffset: (bo.selectedWaistIndex * 40).toDouble(),
              ),
              itemCount: waist.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                var label = waist[i];
                return LabeledRadio(
                  label: label,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  enabled: checkCanEnableWaist(i),
                  value: i,
                  selected: i == buyOptions.selectedWaistIndex,
                  sizeValue: waist[i],
                  updateGroup: (groupId) {
                    buyOptions.setSelectedWaistIndex(i);
                  },
                );
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          //color: Colors.grey,
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            'LENGTH',
            style: TextStyle(
              fontFamily: 'Interstate',
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.grey[300],
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          child: Consumer<BuyingOptions>(
            builder: (ctx, buyOptions, _) => ListView.builder(
              itemCount: length.length,
              controller: ScrollController(
                initialScrollOffset: (bo.selectedLengthIndex * 40).toDouble(),
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                var label = length[i];
                return LabeledRadio(
                  label: label,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  enabled: checkCanEnableLength(i),
                  value: i,
                  selected: i == buyOptions.selectedLengthIndex,
                  sizeValue: length[i],
                  updateGroup: (groupId) {
                    buyOptions.setSelectedLengthIndex(i);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SingleFactorSize extends StatelessWidget {
  final List<String> sizes;
  final List<Swatch> swatches;

  SingleFactorSize(this.swatches, {this.sizes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          //color: Colors.grey,
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            'SIZE',
            style: TextStyle(
              fontFamily: 'Interstate',
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              shadows: [
                Shadow(
                  blurRadius: 7.0,
                  color: Colors.grey[400],
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          child: Consumer<BuyingOptions>(
            builder: (context, buyOptions, _) => ListView.builder(
              itemCount: sizes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                var label = sizes[i];
                return LabeledRadio(
                  label: label,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  enabled: i > 3 ? false : true,
                  value: i,
                  selected: i == buyOptions.selectedSizeIndex,
                  sizeValue: sizes[i],
                  updateGroup: (index) {
                    buyOptions.setSelectedSizeIndex(i);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

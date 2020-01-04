import 'package:flutter/material.dart';
import './widgets/labeled_radio.dart';

class SizeSelector extends StatefulWidget {
  final List<String> waist;
  final List<String> length;
  final List<String> sizes;

  const SizeSelector.forWasitLength(
      {@required this.waist, @required this.length, this.sizes = const []});

  const SizeSelector.forSizes(
      {@required this.sizes, this.waist = const [], this.length = const []});

  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  int _selectedWaist = 0;
  int _selectedLength = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 60,
            child: Text(
              'Select Size',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            // margin: const EdgeInsets.all(5),
            // color: Colors.grey,
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'Waist',
              style: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 18,
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
            height: 35,
            child: ListView.builder(
              itemCount: widget.waist.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                var label = widget.waist[i];
                return LabeledRadio(
                  label: label,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  enabled: i > 3 ? false : true,
                  value: i,
                  selected: _selectedWaist == i,
                  sizeValue: widget.waist[i],
                  updateGroup: (groupId) {
                    setState(() {
                      _selectedWaist = groupId;
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Container(
            //color: Colors.grey,
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'Length',
              style: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 18,
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
            height: 35,
            child: ListView.builder(
              itemCount: widget.length.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                var label = widget.length[i];
                return LabeledRadio(
                  label: label,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  enabled: i > 3 ? false : true,
                  value: i,
                  selected: _selectedLength == i,
                  sizeValue: widget.length[i],
                  updateGroup: (groupId) {
                    setState(() {
                      _selectedLength = groupId;
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 21),
          FlatButton(
            color: Colors.black,
            shape: Border.all(
              color: Colors.grey[600],
              width: .75,
            ),
            textColor: Colors.black,
            padding: EdgeInsets.all(12.0),
            onPressed: () {
              print('Size :: ${widget.waist[_selectedWaist]} X ${widget.length[_selectedLength]}');
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
    );
  }
}

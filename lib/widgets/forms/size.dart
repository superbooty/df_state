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
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            child: Text(
              'Select Size',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            // margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(left: 10),
            // color: Colors.grey,
            child: Text(
              'Waist',
              style: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
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
            padding: const EdgeInsets.only(left: 10),
            //color: Colors.grey,
            child: Text(
              'Length',
              style: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
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
          )
        ],
      ),
    );
  }
}

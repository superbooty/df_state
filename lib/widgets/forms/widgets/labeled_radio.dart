import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    this.label,
    this.padding,
    this.selected,
    this.enabled,
    this.value,
    this.groupValue,
    this.updateGroup,
  });

  final String label;
  final EdgeInsets padding;
  final bool selected;
  final bool enabled;
  final int value;
  final int groupValue;
  final Function updateGroup;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: padding,
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            //color: !enabled ? Colors.grey[200] : Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: selected ? Colors.red[700] : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  updateGroup(value);
                },
                child: Text(label,
                  style: TextStyle(
                    decoration: !enabled ? TextDecoration.lineThrough : TextDecoration.none,
                    fontSize: 16,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
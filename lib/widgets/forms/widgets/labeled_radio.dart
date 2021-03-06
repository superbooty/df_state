import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    this.label,
    this.padding,
    this.selected,
    this.enabled,
    this.value,
    this.sizeValue,
    this.updateGroup,
  });

  final String label;
  final EdgeInsets padding;
  final bool selected;
  final bool enabled;
  final int value;
  final String sizeValue;
  final Function updateGroup;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: padding,
        child: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            //color: !enabled ? Colors.grey[200] : Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: enabled && selected ? Color(0XFFc41130) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (enabled) {
                    updateGroup(value);
                  }
                },
                child: SizedBox(
                  width: 30,
                  height: 22,
                  child: Text(label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decorationThickness: 3,
                      letterSpacing: 1.5,
                      decoration: !enabled ? TextDecoration.lineThrough : TextDecoration.none,
                      fontFamily: 'Interstate',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: !enabled ? Colors.grey[400] : Colors.grey[700],
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
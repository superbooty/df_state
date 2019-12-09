import 'package:flutter/material.dart';

class MyPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (_) {},
      icon: Icon(
        Icons.more_vert,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          child: Text('one'),
        ),
        PopupMenuItem(
          child: Text('two'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MenuItemHomepage extends StatelessWidget {
  const MenuItemHomepage({Key? key, this.letterSpacing}) : super(key: key);
  final double? letterSpacing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 16.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          'Homepage',
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue[500],
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

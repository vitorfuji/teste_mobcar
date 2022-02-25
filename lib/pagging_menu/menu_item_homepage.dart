import 'package:flutter/material.dart';

class MenuItemHomepage extends StatelessWidget {
  const MenuItemHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 16.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          'Homepage',
          style: TextStyle(
            color: Colors.lightBlue[500],
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

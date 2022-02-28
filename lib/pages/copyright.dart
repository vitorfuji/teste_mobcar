import 'package:flutter/material.dart';

class Copyright extends StatefulWidget {
  const Copyright({Key? key}) : super(key: key);

  @override
  State<Copyright> createState() => _CopyrightState();
}

class _CopyrightState extends State<Copyright> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.copyright,
            color: Color.fromRGBO(0, 151, 208, 1),
          ),
          Padding(
            padding: EdgeInsets.all(13.5),
            child: Text(
              '2020. All rights reserved to Mobcar.',
              style: TextStyle(
                color: Color.fromRGBO(0, 151, 208, 1),
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

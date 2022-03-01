
import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  GlobalKey<ScaffoldState> scaff = new GlobalKey<ScaffoldState>();
static const popItem = <String> [
  "View",
  "Edit",
  "Delete",
  ];
  static List<PopupMenuItem<String>> pop = popItem.map((String val) =>
      PopupMenuItem<String>(
        value: val,
        child: Text(val),
      ),
  ).toList();

  late String value;

  ViewPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PopupMenuButton(
          iconSize: 20.0,
              color: Colors.black,
              padding: const EdgeInsets.only(left:345.0),
            onSelected: (String val){
              value = val;
              scaff.currentState!.showSnackBar(
                SnackBar(content: Text(val)),
              );
            },
              itemBuilder:(BuildContext context) => pop),
      ],
    );
  }
}

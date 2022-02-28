import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class CopyrightMenu extends StatelessWidget {
  const CopyrightMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FooterView(
      footer: Footer(
        backgroundColor: Colors.transparent,
        child: Center(
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
        ),
      ),
      flex: 1, children: const[], //default flex is 2
    );
  }
}

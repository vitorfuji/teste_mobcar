import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:mobcar/pages/menu_appbar.dart';
import 'package:mobcar/pagging_menu/logo_font.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = ['Item 1, Item 2, Item 3, Item 4'];

  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoFont(),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, //Return buttom
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu_open,
            ),
            color: Colors.lightBlue[600],
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                PageTransition(
                  child: const MenuAppBarPage(),
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 450),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          const ListTile(
            title: Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 5.0),
              child: Text(
                'Title 1',
                textAlign: TextAlign.left,
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                'Title 2',
                textAlign: TextAlign.left,
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(32),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.resolveWith((states) => Colors.black),
              ),
              child: const Text(
                'Add new',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Title',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: IconButton(
                        alignment: Alignment.topLeft,
                        icon: const Icon(
                          Icons.car_repair,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          null;
                        },
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 24, left: 24, right: 24),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ),
                            child: Image.network(
                              'https://s3-alpha-sig.figma.com/img/6015/6963/efaec74c542b0ea5e5a65d731fff89a2?Expires=1646611200&Signature=JbO7dq5k2Fi5cARpCjJSIvydd6XHz00vZYcXrhMiTR2~8OdahRJ-k9Z2gHqo8RjZullxPuPfiIkzEAz7Sx1TNJC7Udnkj6NU~VHmQ1OAAdsqsQV91TP8mhQCvIHpRCE-YqYwlZt7EtxhuAc6W0GTiF6jdR-B9jcYmQACX3IVch8S7sQRTCH-XQBbiUoWPwjPf3ia8DNisqxzUlRM662hdXYlGu9ZJXS4lGwMRxAq3jZWPQ32OGxDy3Teao67uIyfVw7bBHEfHphWxphV9DGDQ7-kYlrGvtUYTdRJUEFMmRraFZ1MgiJSuuaZDIhiQAq3zVpcyk9u0JMxa4iGdVULTA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: value,
                              iconSize: 24,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              isExpanded: true,
                              items: items.map(buildMenuItem).toList(),
                              onChanged: (value) =>
                                  setState(() => this.value = value),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.white),
                          ),
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            print('Cancelado'); //corrigir depois
                          },
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.black),
                          ),
                          child: const Text(
                            'Salvar',
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            print('Salvo'); //corrigir depois
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          FooterView(
            footer: Footer(
              backgroundColor: Colors.black,
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
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:mobcar/pages/addnew_button.dart';
import 'package:mobcar/pages/copyright.dart';
import 'package:mobcar/pages/menu_appbar.dart';
import 'package:mobcar/pages/view_page.dart';
import 'package:mobcar/pagging_menu/logo_font.dart';
import 'package:page_transition/page_transition.dart';

class HomePageTest extends StatefulWidget {
  const HomePageTest({Key? key}) : super(key: key);

  @override
  State<HomePageTest> createState() => _HomePageTestState();
}

class _HomePageTestState extends State<HomePageTest> {
  final items = ['Item 1, Item 2, Item 3, Item 4'];

  String? value;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const LogoFont(),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false, //Return buttom
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu_open,
              ),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  PageTransition(
                    child: const MenuAppBarPage(),
                    type: PageTransitionType.rightToLeft,
                    duration: const Duration(milliseconds: 450),
                  ),
                );
              },
              color: const Color.fromRGBO(0, 151, 208, 1),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(1),
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, left: 16.0),
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
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    const Text(
                      'Title 2',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    Expanded(child: Container()),
                    const AddNewButton(),
                  ],
                ),
              ),
          ViewPage(),
            ],
          ),

        ),

        bottomNavigationBar: const Copyright(),
      ),
    );
  }
}
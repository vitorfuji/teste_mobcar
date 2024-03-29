import 'package:flutter/material.dart';
import 'package:mobcar/pages/copyright.dart';
import 'package:mobcar/pages/copyright_menu.dart';
import 'package:mobcar/pages/home_page.dart';
import 'package:mobcar/pages/homepagetest.dart';
import 'package:mobcar/pagging_menu/logo_font.dart';
import 'package:mobcar/pagging_menu/menu_item.dart';
import 'package:mobcar/pagging_menu/menu_item_homepage.dart';
import 'package:page_transition/page_transition.dart';


class MenuAppBarPage extends StatelessWidget {
  const MenuAppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: const LogoFont(),
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              //Return buttom
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.menu_open,
                  ),
                  color: const Color.fromRGBO(0, 151, 208, 1),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                      PageTransition(
                        child: const HomePageTest(),
                        type: PageTransitionType.leftToRight,
                        duration: const Duration(milliseconds: 450),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: Stack(
              children: <Widget>[
                SizedBox(
                  child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/57fd/45cd/679b58d7ac1bea0f747cfff1d1197286?Expires=1646611200&Signature=AqiQi7FLUC0xvlohUEse6TuQw-64qgvl5x88Rje8oSuA7MNgqsylzFw30IM3cAsiQ3~Tb1It21vi-zKbUN0EVt7U-E74XWrPL-weiYmdPgVwgwD-9zwOqR4uB7KUIdi5Q1fDrTUIb26dJPTcl-5f-Yq05kWOFkSiiEaf07vwr0W780J9hpVQ770lXQZxmaH9kOxXq273h7ONbL1QHB4LeRek233ThRPNKGHLq3KuxLSMVeQ4VylIogpg2m-nc2AZtjjJosk2NJTf0KGRtjCqnbnhpj2Xbo5zgA8bDm8HSMwptGLowXpttFkVMpdVU-zUnzbQ4zhc7qheywy78dD5~w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                const CopyrightMenu(),
                ListView(
                  children: const [
                    MenuItemHomepage(),
                    MenuItem(),
                    MenuItem(),
                    MenuItem(),
                    MenuItem(),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

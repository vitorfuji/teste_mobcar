import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobcar/pages/home_page.dart';
import 'package:mobcar/pages/homepagetest.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );

  runApp(const MobcarApp());
}

class MobcarApp extends StatelessWidget {
  const MobcarApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF000000)),
      home: HomePageTest(),
    );
  }
}

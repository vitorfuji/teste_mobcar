import 'package:flutter/material.dart';
import 'package:mobcar/api/api_cars.dart';
import 'package:mobcar/pages/menu_appbar.dart';
import 'package:mobcar/pagging_menu/logo_font.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final api = ApiCars();

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
      body: FutureBuilder<List>(
        future: api.pegarUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar Usuários'),
            );
          }

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]['nome']),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

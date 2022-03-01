// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class ApiMarca extends StatefulWidget {
//   const ApiMarca({Key? key}) : super(key: key);
//
//   @override
//   State<ApiMarca> createState() => ApiMarcaState();
// }
//
// class ApiMarcaState extends State<ApiMarca> {
//   var dropDownValue;
//
//   Future getMarcaData() async {
//     var response = await http
//         .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));
//     var jsonData = jsonDecode(response.body);
//     List<Carro> carros = [];
//
//     for (var u in jsonData) {
//       Carro carro = Carro(
//         u['nome'],
//         u['codigo'],
//       );
//       carros.add(carro);
//     }
//     print(carros.length);
//     return carros;
//   }
//
//   Future getModeloCarro(String codigoCarro) async {
//     var response = await http
//         .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas/${codigoCarro}/modelos'));
//     var jsonData = jsonDecode(response.body);
//     print(jsonData);
//     List<Carro> carros = [];
//
//     for (var u in jsonData) {
//       Carro carro = Carro(
//         u['nome'],
//         u['codigo'],
//       );
//       carros.add(carro);
//     }
//     print(carros.length);
//     return carros;
//   }
//   late String _myState;
//   late List listaCarro;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 15, right: 15, top: 5),
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Expanded(
//             child: DropdownButtonHideUnderline(
//               child: ButtonTheme(
//                 alignedDropdown: true,
//                 child: DropdownButton<String>(
//                   value: _myState,
//                   iconSize: 30,
//                   icon: (null),
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: 16,
//                   ),
//                   hint: Text('Select State'),
//                   onChanged: (value) {
//                     setState(() {
//                       _myState = value;
//                       getMarcaData();
//                       print(_myState);
//                     });
//                   },
//                   items: statesList?.map((item) {
//                     return new DropdownMenuItem(
//                       child: new Text(item['name']),
//                       value: item['id'].toString(),
//                     );
//                   })?.toList() ??
//                       [],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//     SizedBox(
//     height: 30,
//     ),
//     return FutureBuilder(
//       future: getMarcaData(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.hasData) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               padding: const EdgeInsets.only(
//                 left: 16.0,
//                 right: 16.0,
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black, width: 1),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: DropdownButton<String>(
//                 hint: Text(dropDownValue ?? 'Marca'),
//                 icon: Icon(Icons.arrow_drop_down),
//                 iconSize: 32,
//                 isExpanded: true,
//                 underline: const SizedBox(),
//                 style: const TextStyle(
//                   color: Color.fromRGBO(109, 109, 109, 1),
//                   fontSize: 14.0,
//                 ),
//                 items: snapshot.data.map<DropdownMenuItem<String>>((carro) {
//                   return DropdownMenuItem<String>(
//                     value: carro.codigo,
//                     child: Text(carro.nome),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     dropDownValue = value;
//                     print('onchanged:'+ value!);
//                     getModeloCarro(value);
//                   });
//                 },
//               ),
//             ),
//           );
//         } else {
//           return const Center(
//             child: Text('Carregando...'),
//           );
//         }
//       },
//     );
//   }
// }
//
// class Carro {
//   late final String nome, codigo;
//
//   Carro(
//     this.nome,
//     this.codigo,
//   );
// }
//
// Future<String> getCarros() async {
//   await http.get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas')).then((response) {
//     var data = json.decode(response.body);
//
// //      print(data);
//     setState(() {
//       statesList = data['state'];
//     });
//   });
//   return data;
// }

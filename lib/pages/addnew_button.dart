import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddNewButton extends StatefulWidget {
  const AddNewButton({Key? key}) : super(key: key);

  @override
  State<AddNewButton> createState() => _AddNewButtonState();
}

class _AddNewButtonState extends State<AddNewButton> {

  var marcaSelecionada;
  var modeloSelecionado;

  Future getMarcas() async {
    final response = await http
        .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<Marca> marcas = [];

      for (var u in jsonData) {
        Marca marca = Marca(
          u['nome'],
          u['codigo'],
        );
        marcas.add(marca);
      }
      // setState(() {
      //   marcaSelecionada = marcas[0].codigo;
      // });

      return marcas;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load MARCAS');
    }
  }

  Future getModelos(String codigoCarro) async {
    final response = await http
        .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas/$codigoCarro/modelos'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<Modelo> modelos = [];

      for (var u in jsonData['modelos']) {

        Modelo modelo = Modelo(
          u['nome'],
          u['codigo'].toString(),
        );
        modelos.add(modelo);
      }
      // setState(() {
      //   modeloSelecionado = modelos[0].codigo;
      // });
      return modelos;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load MODELOS');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: SizedBox(
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
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        iconSize: 25.0,
                        icon: const Icon(
                          Icons.car_repair,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          null;
                        },
                      ),
                      const Text(
                        'Title',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 5, left: 5, right: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        child: Image.network(
                          'https://s3-alpha-sig.figma.com/img/6015/6963/efaec74c542b0ea5e5a65d731fff89a2?Expires=1646611200&Signature=JbO7dq5k2Fi5cARpCjJSIvydd6XHz00vZYcXrhMiTR2~8OdahRJ-k9Z2gHqo8RjZullxPuPfiIkzEAz7Sx1TNJC7Udnkj6NU~VHmQ1OAAdsqsQV91TP8mhQCvIHpRCE-YqYwlZt7EtxhuAc6W0GTiF6jdR-B9jcYmQACX3IVch8S7sQRTCH-XQBbiUoWPwjPf3ia8DNisqxzUlRM662hdXYlGu9ZJXS4lGwMRxAq3jZWPQ32OGxDy3Teao67uIyfVw7bBHEfHphWxphV9DGDQ7-kYlrGvtUYTdRJUEFMmRraFZ1MgiJSuuaZDIhiQAq3zVpcyk9u0JMxa4iGdVULTA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                        ),
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child:FutureBuilder(
                                future: getMarcas(),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black, width: 1),
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: DropdownButton<String>(
                                          hint: Text(marcaSelecionada ?? 'Marca'),
                                          value: marcaSelecionada,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 32,
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          style: const TextStyle(
                                            color: Color.fromRGBO(109, 109, 109, 1),
                                            fontSize: 14.0,
                                          ),
                                          items: snapshot.data.map<DropdownMenuItem<String>>((carro) {
                                            return DropdownMenuItem<String>(
                                              value: carro.codigo,
                                              child: Text(carro.nome),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              marcaSelecionada = value;
                                              getModelos(value!);

                                            });
                                          },

                                        ),

                                      ),
                                    );
                                  } else {
                                    return const Center(
                                      child: Text('Carregando...'),
                                    );
                                  }
                                },

                      ),
                    ),
                    // DropdownButtonHideUnderline(
                    //   child: Builder(
                    //     builder: (context) {
                    //       return FutureBuilder(
                    //         future: getModelos(marcaSelecionada),
                    //         builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //           if (snapshot.hasData) {
                    //             return Padding(
                    //               padding: const EdgeInsets.all(16.0),
                    //               child: Container(
                    //                 padding: const EdgeInsets.only(
                    //                   left: 16.0,
                    //                   right: 16.0,
                    //                 ),
                    //                 decoration: BoxDecoration(
                    //                   border: Border.all(color: Colors.black, width: 1),
                    //                   borderRadius: BorderRadius.circular(8.0),
                    //                 ),
                    //                 child: DropdownButton<String>(
                    //                   value: modeloSelecionado,
                    //                   hint: Text(snapshot.data[0].nome ?? '1'),
                    //                   icon: Icon(Icons.arrow_drop_down),
                    //                   iconSize: 32,
                    //                   isExpanded: true,
                    //                   underline: const SizedBox(),
                    //                   style: const TextStyle(
                    //                     color: Color.fromRGBO(109, 109, 109, 1),
                    //                     fontSize: 14.0,
                    //                   ),
                    //                   items: snapshot.data.map<DropdownMenuItem<String>>((modelo) {
                    //                     return DropdownMenuItem<String>(
                    //                       value: modelo.codigo,
                    //                       child: Text(modelo.nome),
                    //                     );
                    //                   }).toList(),
                    //                   onChanged: (value) {
                    //                     setState(() {
                    //                       modeloSelecionado = value;
                    //                       getModelos(value!);
                    //                     });
                    //                   },
                    //                 ),
                    //               ),
                    //             );
                    //           } else {
                    //             return const Center(
                    //               child: Text('Carregando...'),
                    //             );
                    //           }
                    //         },
                    //       );
                    //     }
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith(
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
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Marca {
  late final String nome, codigo;

  Marca(
    this.nome,
    this.codigo,
  );
}

class Modelo {
  late final String nome;
  late final String codigo;

  Modelo(
    this.nome,
    this.codigo,
    );
}

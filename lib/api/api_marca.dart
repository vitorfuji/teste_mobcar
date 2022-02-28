import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiMarca extends StatefulWidget {
  const ApiMarca({Key? key}) : super(key: key);

  @override
  State<ApiMarca> createState() => ApiMarcaState();
}

class ApiMarcaState extends State<ApiMarca> {
  var dropDownValue;

  Future getCarroData() async {
    var response = await http
        .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));
    var jsonData = jsonDecode(response.body);
    List<Carro> carros = [];

    for (var u in jsonData) {
      Carro carro = Carro(
        u['nome'],
        u['codigo'],
      );
      carros.add(carro);
    }
    print(carros.length);
    return carros;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCarroData(),
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
                hint: Text(dropDownValue ?? 'Marca'),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: const SizedBox(),
                style: const TextStyle(
                  color: Color.fromRGBO(109, 109, 109, 1),
                  fontSize: 14.0,
                ),
                items: snapshot.data.map<DropdownMenuItem<String>>((carro) {
                  return DropdownMenuItem<String>(
                    value: carro.nome,
                    child: Text(carro.nome),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropDownValue = value;
                    print(value);
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
    );
  }
}

class Carro {
  late final String nome, codigo;

  Carro(
    this.nome,
    this.codigo,
  );
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCars {
  Future<List> pegarUsuarios() async {
    var url = Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas');
    var response = await http.get(url);
    if(response.statusCode == 200){
      return jsonDecode(utf8.decode(response.bodyBytes));
    }else{
      throw Exception('Erro ao carregar dados do Servidor');
    }
  }
}
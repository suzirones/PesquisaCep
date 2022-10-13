import 'package:http/http.dart' as http;

import 'Cep.dart';

class ViaCepService {
  static Future<Cep> fetchCep({required String cep}) async {
    final response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));

    if (response.statusCode == 200) {
      return Cep.fromJson(response.body);
    } else {
      throw Exception(response.toString());
    }
  }
}

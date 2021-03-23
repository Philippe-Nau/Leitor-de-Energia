import 'dart:convert';
import 'package:controle_fornecedores/data/repositorys/interface/newMeterRepositoryInterface.dart';
import 'package:http/http.dart' as http;

class NewMeterRepository implements Newmeterrepositoryinterface {
  final String _baseUrl = 'http://localhost:3333';

  postMeter(String _codMeter) {
    try {
      http.post(Uri.parse('$_baseUrl/medidores'),
          body: json.encode(
            {'codMeter': _codMeter},
          ),
          headers: {'Content-Type': 'application/json'});
    } catch (e) {
      rethrow;
    }
  }
}

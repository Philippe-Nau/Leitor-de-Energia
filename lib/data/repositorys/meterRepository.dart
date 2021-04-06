import 'dart:convert';
import 'package:controle_fornecedores/data/models/freeMeterModel.dart';
import 'package:controle_fornecedores/data/models/meterModel.dart';
import 'package:controle_fornecedores/data/repositorys/interface/meterRepositoryInterface.dart';
import 'package:http/http.dart' as http;

class MeterRepository implements MeterRepositoryinterface {
  final String _baseUrl = 'http://localhost:3333';

  @override
  Future<List<MeterModel>> findAllMeters() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/meters'));
      Map<String, dynamic> jsonDecode;
      if (response.statusCode == 200) jsonDecode = json.decode(response.body);
      return jsonDecode['meters']
          .map<MeterModel>((resp) => MeterModel.fromMap(resp))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FreeMeterModel>> findFreeMeters() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/meters/free'));
      Map<String, dynamic> jsonDecode;
      if (response.statusCode == 200) jsonDecode = json.decode(response.body);
      return jsonDecode['freeMeters']
          .map<FreeMeterModel>((resp) => FreeMeterModel.fromMap(resp))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> postMeter(String _codMeter) async {
    try {
      var response = await http.post(Uri.parse('$_baseUrl/meters'),
          body: json.encode(
            {'codMeter': _codMeter},
          ),
          headers: {'Content-Type': 'application/json'});
      return response.statusCode == 201;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteMeter(int _idMeter) async {
    try {
      var response = await http.delete(
        Uri.parse('$_baseUrl/meters/$_idMeter'),
      );
      return response.statusCode == 201;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> alterMeter(int _idMeter, String _codMeter) async {
    try {
      var response = await http.patch(Uri.parse('$_baseUrl/meters/$_idMeter'),
          body: json.encode(
            {'codMeter': _codMeter},
          ),
          headers: {'Content-Type': 'application/json'});
      return response.statusCode == 201;
    } catch (e) {
      rethrow;
    }
  }
}

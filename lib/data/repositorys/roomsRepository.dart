import 'dart:convert';
import 'package:controle_fornecedores/data/models/freeMeterModel.dart';
import 'package:controle_fornecedores/data/models/roomModel.dart';
import 'package:controle_fornecedores/data/repositorys/interface/roomsRepositoryInterface.dart';
import 'package:http/http.dart' as http;

class RoomsRepository implements Roomsrepositoryinterface {
  final String _baseUrl = 'http://localhost:3333';

  @override
  Future<List<RoomModel>> findAllRooms() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/rooms'));
      Map<String, dynamic> jsonDecode;
      if (response.statusCode == 200) jsonDecode = json.decode(response.body);
      return jsonDecode['rooms']
          .map<RoomModel>((resp) => RoomModel.fromMap(resp))
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

  Future<bool> postRoom(String _numRoom, int _idMeter) async {
    try {
      var response = await http.post(Uri.parse('$_baseUrl/rooms'),
          body: json.encode(
            {
              'numRoom': _numRoom,
              'idMeter': _idMeter,
            },
          ),
          headers: {'Content-Type': 'application/json'});
      return response.statusCode == 201;
    } catch (e) {
      rethrow;
    }
  }
}

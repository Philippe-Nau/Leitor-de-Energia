import 'dart:convert';

import 'package:controle_fornecedores/data/models/freeRoomsModel.dart';
import 'package:controle_fornecedores/data/models/storeModel.dart';
import 'package:controle_fornecedores/data/repositorys/interface/storeRepositoryInterface.dart';
import 'package:http/http.dart' as http;

class StoreRepository implements StoreRepositoryInterface {
  final String _baseUrl = 'http://localhost:3333';

  @override
  Future<List<StoreModel>> findAllStores() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/stores'));
      Map<String, dynamic> jsonDecode;
      if (response.statusCode == 200) jsonDecode = json.decode(response.body);
      return jsonDecode['stores']
          .map<StoreModel>((resp) => StoreModel.fromMap(resp))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FreeRoomModel>> findFreeRooms() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/rooms/free'));
      Map<String, dynamic> jsonDecode;
      if (response.statusCode == 200) jsonDecode = json.decode(response.body);
      return jsonDecode['freeRooms']
          .map<FreeRoomModel>((resp) => FreeRoomModel.fromMap(resp))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}

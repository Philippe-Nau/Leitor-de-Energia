import 'package:controle_fornecedores/data/models/roomModel.dart';

abstract class Roomsrepositoryinterface {
  Future<List<RoomModel>> findAllRooms();
}

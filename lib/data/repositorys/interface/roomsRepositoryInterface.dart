import 'package:controle_fornecedores/data/models/freeMeterModel.dart';
import 'package:controle_fornecedores/data/models/roomModel.dart';

abstract class Roomsrepositoryinterface {
  Future<List<RoomModel>> findAllRooms();
  Future<List<FreeMeterModel>> findFreeMeters();
  Future<bool> postRoom(String _numRoom, int _idMeter);
}
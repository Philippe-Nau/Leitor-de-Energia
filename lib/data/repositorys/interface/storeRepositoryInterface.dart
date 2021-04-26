import 'package:controle_fornecedores/data/models/freeRoomsModel.dart';
import 'package:controle_fornecedores/data/models/storeModel.dart';

abstract class StoreRepositoryInterface {
  Future<List<StoreModel>> findAllStores();
  Future<List<FreeRoomModel>> findFreeRooms();
}

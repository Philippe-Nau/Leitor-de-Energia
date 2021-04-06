import 'package:controle_fornecedores/data/models/storeModel.dart';

abstract class StoreRepositoryInterface {
  Future<List<StoreModel>> findAllStores();
}

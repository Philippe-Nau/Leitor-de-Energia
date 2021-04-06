import 'package:controle_fornecedores/controller/storeController.dart';
import 'package:controle_fornecedores/data/repositorys/interface/storeRepositoryInterface.dart';
import 'package:controle_fornecedores/data/repositorys/storeRepository.dart';
import 'package:get/get.dart';

class Storesbinding implements Bindings {
  @override
  void dependencies() {
    Get.put<StoreRepositoryInterface>(StoreRepository());
    Get.put(StoreController(Get.find()));
  }
}

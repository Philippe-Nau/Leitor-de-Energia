import 'package:controle_fornecedores/controller/roomController.dart';
import 'package:controle_fornecedores/data/repositorys/interface/roomsRepositoryInterface.dart';
import 'package:controle_fornecedores/data/repositorys/roomsRepository.dart';
import 'package:get/get.dart';

class Roomsbinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Roomsrepositoryinterface>(RoomsRepository());
    Get.put(RoomController(Get.find()));
  }
}

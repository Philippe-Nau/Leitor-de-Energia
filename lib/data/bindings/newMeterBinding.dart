import 'package:controle_fornecedores/controller/formNewMeterController.dart';
import 'package:controle_fornecedores/data/repositorys/interface/newMeterRepositoryInterface.dart';
import 'package:controle_fornecedores/data/repositorys/newMeterRepository.dart';
import 'package:get/get.dart';

class Newmeterbinding implements Bindings {
  @override
  void dependencies() {
    Get.put<Newmeterrepositoryinterface>(NewMeterRepository());
    Get.put(Formnewmetercontroller(Get.find()));
  }
}

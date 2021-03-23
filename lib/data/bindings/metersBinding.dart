import 'package:controle_fornecedores/controller/meterController.dart';
import 'package:controle_fornecedores/data/repositorys/interface/meterRepositoryInterface.dart';
import 'package:controle_fornecedores/data/repositorys/meterRepository.dart';
import 'package:get/get.dart';

class Metersbinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MeterRepositoryinterface>(MeterRepository());
    Get.put(MeterController(Get.find()));
  }
}

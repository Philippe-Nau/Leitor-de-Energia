import 'package:controle_fornecedores/data/repositorys/interface/meterRepositoryInterface.dart';
import 'package:get/get.dart';

class MeterController extends GetxController with StateMixin {
  final MeterRepositoryinterface _meterRepository;
  MeterController(this._meterRepository);

  @override
  void onInit() {
    super.onInit();
    findMeters();
  }

  Future<void> findMeters() async {
    change([], status: RxStatus.loading());
    try {
      final data = await _meterRepository.findAllMeters();
      change(data, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar medidor.'));
    }
  }
}

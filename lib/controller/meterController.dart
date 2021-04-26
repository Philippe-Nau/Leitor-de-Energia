import 'package:controle_fornecedores/data/repositorys/interface/meterRepositoryInterface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeterController extends GetxController with StateMixin {
  final MeterRepositoryinterface _meterRepository;
  MeterController(this._meterRepository);
  final TextEditingController codMeterController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    findMeters();
  }

  onClose() {
    super.onClose();
    codMeterController.dispose();
    scrollController.dispose();
  }

  Future<void> findMeters() async {
    change([], status: RxStatus.loading());
    try {
      final data = await _meterRepository.findAllMeters();
      change(data, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar medidores.'));
    }
  }

  postMeter(GlobalKey<FormState> _key, String _codMeter) async {
    if (_key.currentState.validate()) {
      final resp = await _meterRepository.postMeter(_codMeter);
      if (resp) {
        findMeters().then((value) {
          Get.back();
        });
      }
    }
  }

  alterMeter(GlobalKey<FormState> _key, int _idMeter, String _codMeter) async {
    if (_key.currentState.validate()) {
      final resp = await _meterRepository.alterMeter(_idMeter, _codMeter);
      if (resp) {
        findMeters().then((value) {
          Get.back();
        });
      }
    }
  }

  deleteMeter(int _idMeter) async {
    final resp = await _meterRepository.deleteMeter(_idMeter);
    if (resp) findMeters().then((value) => Get.back());
  }
}

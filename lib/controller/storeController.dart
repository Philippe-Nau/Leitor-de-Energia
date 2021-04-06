import 'package:controle_fornecedores/data/repositorys/interface/storeRepositoryInterface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreController extends GetxController with StateMixin {
  final StoreRepositoryInterface _storeRepository;
  StoreController(this._storeRepository);
  TextEditingController storeNameController = TextEditingController();

  void onInit() {
    super.onInit();
    findStores();
  }

  Future findStores() async {
    change([], status: RxStatus.loading());
    try {
      final data = await _storeRepository.findAllStores();
      change(data, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar lojas.'));
    }
  }
}

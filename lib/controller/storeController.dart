import 'package:controle_fornecedores/data/models/freeRoomsModel.dart';
import 'package:controle_fornecedores/data/repositorys/interface/storeRepositoryInterface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreController extends GetxController with StateMixin {
  final StoreRepositoryInterface _storeRepository;
  StoreController(this._storeRepository);
  TextEditingController storeNameController = TextEditingController();
  TextEditingController codMeterController = TextEditingController();
  List<FreeRoomModel> _freeRoomsList;
  List<FreeRoomModel> get freeRoomsList => [..._freeRoomsList];
  RxInt selectedRoom = 0.obs;

  void onInit() {
    super.onInit();
    findStores();
    findFreeRooms();
  }

  onClose() {
    super.onClose();
    storeNameController.dispose();
    codMeterController.dispose();
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

  Future<void> findFreeRooms() async {
    _freeRoomsList = await _storeRepository.findFreeRooms();
    update();
  }

  selectRoom(FreeRoomModel value) {
    selectedRoom.value = value.idRoom;
    codMeterController.text = value.codMeter;
  }
}

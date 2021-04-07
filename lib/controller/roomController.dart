import 'package:controle_fornecedores/data/models/freeMeterModel.dart';
import 'package:controle_fornecedores/data/repositorys/interface/roomsRepositoryInterface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomController extends GetxController with StateMixin {
  final Roomsrepositoryinterface _roomRepository;
  RoomController(this._roomRepository);
  TextEditingController roomCodeController = TextEditingController();

  List<FreeMeterModel> _freeMeterList;
  List<FreeMeterModel> get freeMeterModel => [..._freeMeterList];
  RxInt selectedMeter = 0.obs;

  void onInit() {
    super.onInit();
    findRooms();
    findFreeMeters();
  }

  Future findRooms() async {
    change([], status: RxStatus.loading());
    try {
      final data = await _roomRepository.findAllRooms();
      change(data, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar salas.'));
    }
  }

  Future<void> findFreeMeters() async {
    _freeMeterList = await _roomRepository.findFreeMeters();
    update();
  }

  selectMeter(value) {
    selectedMeter.value = value;
  }

  postRoom(GlobalKey<FormState> _key, String _numRoom, int _idMeter) async {
    if (_key.currentState.validate()) {
      final resp = await _roomRepository.postRoom(_numRoom, _idMeter);
      if (resp) {
        findRooms().then((value) {
          Get.back();
        });
      }
    }
  }
}

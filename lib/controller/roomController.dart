import 'package:controle_fornecedores/data/repositorys/interface/meterRepositoryInterface.dart';
import 'package:controle_fornecedores/data/repositorys/interface/roomsRepositoryInterface.dart';
import 'package:controle_fornecedores/data/repositorys/meterRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomController extends GetxController with StateMixin {
  final Roomsrepositoryinterface _roomRepository;
  RoomController(this._roomRepository);
  TextEditingController roomCodeController = TextEditingController();

  void onInit() {
    super.onInit();
    findRooms();
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
}

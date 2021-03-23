import 'package:controle_fornecedores/data/repositorys/interface/newMeterRepositoryInterface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Formnewmetercontroller extends GetxController with StateMixin {
  final Newmeterrepositoryinterface _newMeterController;
  Formnewmetercontroller(this._newMeterController);

  final TextEditingController codMeterController = TextEditingController();

  postMeter(GlobalKey<FormState> _key, String _codMeter) {
    if (_key.currentState.validate()) {
      _newMeterController.postMeter(_codMeter);
    }
  }
}

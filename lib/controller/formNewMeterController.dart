import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormNewMeterController extends GetxController {
// final MyRepository repository;
// FormNewMeterController({@required this.repository}) : assert(repository != null);

  TextEditingController meterController = TextEditingController();

  sendMeter(GlobalKey<FormState> formKey) {
    if (formKey.currentState.validate()) print('valido');
  }
}

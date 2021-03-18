import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeterController extends GetxController {
  TextEditingController meterController = TextEditingController();
  final RxList listMeters = [].obs;

  sendMeter(GlobalKey<FormState> formKey) {
    if (formKey.currentState.validate()) print('valido');
  }
}

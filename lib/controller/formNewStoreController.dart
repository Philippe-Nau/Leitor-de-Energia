import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormNewStoreController extends GetxController {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController meterController = TextEditingController();
  final RxMap listRooms = {}.obs;

  linkRoom() {
    listRooms.map((key, value) => null);
  }
}

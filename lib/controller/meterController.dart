import 'dart:convert';
import 'package:controle_fornecedores/model/meterModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeterController extends GetxController {
  final _baseUrl = 'http://localhost:3333';
  final RxList<MeterModel> metersList = <MeterModel>[].obs;

  onInit() {
    getMeters();
    super.onInit;
  }

// Get request
  getMeters() async {
    try {
      var response = await http.get(Uri.parse('$_baseUrl/medidores'));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonDecode = json.decode(response.body);
        jsonDecode.forEach((key, value) {
          List listMeters = value;
          listMeters.forEach((element) {
            metersList.add(MeterModel(
              idMeter: element['idMeter'],
              codMeter: element['codMeter'],
            ));
          });
        });
      } else {
        Get.defaultDialog(
            title: 'Error',
            content: Text("${json.decode(response.body)['error']}"));
      }
    } catch (err) {
      Get.defaultDialog(title: 'Error Catch', content: Text('$err'));
    }
    return null;
  }
}

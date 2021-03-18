import 'dart:convert';
import 'package:controle_fornecedores/model/meterModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const baseUrl = 'http://localhost:3333/medidores';

class MeterApiClient extends GetConnect {
  @override
  void onInit() {
    getMeters();
    super.onInit();
  }

// Get request
  Future<Response> getMeters() async {
    try {
      var response = await get('http://localhost:3333/medidores');
      if (response.statusCode == 200) {
        if (response.body['meters'] != null) {
          response.body.forEach((key, value) {
            List list = value;
            list.forEach((element) {
              
            });
          });
        }
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

// // Post request
// Future<Response> postUser(Map data) => post('http://youapi/users', body: data);
// // Post request with File
// Future<Response<CasesModel>> postCases(List<int> image) {
//   final form = FormData({
//     'file': MultipartFile(image, filename: 'avatar.png'),
//     'otherFile': MultipartFile(image, filename: 'cover.png'),
//   });
//   return post('http://youapi/users/upload', form);
// }
// GetSocket userMessages() {
//   return socket('https://yourapi/users/socket');
// }

}

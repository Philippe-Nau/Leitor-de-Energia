import 'package:controle_fornecedores/controller/geralController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'cardListView.dart';

class ListViewEnergyReading extends GetView<GeralController> {
  final _item = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final GeralController _geralController = Get.put(GeralController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Leitura Mês ${_geralController.month}',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  '${controller.dateNow.day}/${controller.dateNow.month}/${controller.dateNow.year}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: _item.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardListView(
                    buttonDelete: true,
                    title: 'Ametista',
                    line1: 'Loja - 00',
                    line2: 'Medidor - 0000000',
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

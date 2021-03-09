import 'package:controle_fornecedores/controller/geralController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'cardListViewEnergyReading.dart';

class ListViewEnergyReading extends StatelessWidget {
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
              children: [
                Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Leitura Mês ${_geralController.month}',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
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
                  return CardListViewEnergyReading(
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

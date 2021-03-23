import 'package:controle_fornecedores/data/models/meterModel.dart';
import 'package:controle_fornecedores/widgets/cardListViewMeters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListViewMeters extends StatelessWidget {
  final List<MeterModel> listMeter;
  const ListViewMeters({this.listMeter});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: this.listMeter.length,
          itemBuilder: (BuildContext context, int index) {
            bool last = this.listMeter.length == (index + 1);
            return CardListViewMeters(
              codMeter: this.listMeter[index].codMeter,
              margin: last
                  ? EdgeInsets.fromLTRB(15, 0, 15, 80)
                  : EdgeInsets.fromLTRB(15, 0, 15, 10),
            );
          },
        ),
      ),
    );
  }
}

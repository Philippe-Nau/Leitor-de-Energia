import 'package:controle_fornecedores/widgets/cardListViewStores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListViewStores extends StatelessWidget {
  final _item = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: _item.length,
          itemBuilder: (BuildContext context, int index) {
            bool last = _item.length == (index + 1);
            return CardListViewStores(
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

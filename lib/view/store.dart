import 'package:controle_fornecedores/controller/storeController.dart';
import 'package:controle_fornecedores/data/models/storeModel.dart';
import 'package:controle_fornecedores/widgets/cardListView.dart';
import 'package:controle_fornecedores/widgets/listViewEmpty.dart';
import 'package:controle_fornecedores/widgets/listViewPages.dart';
import 'package:controle_fornecedores/widgets/myButton.dart';
import 'package:controle_fornecedores/widgets/myDrawer.dart';
import 'package:controle_fornecedores/widgets/searchInput.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Stores extends GetView<StoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Lojas"),
      ),
      drawer: Drawer(
        child: Mydrawer(),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                SearchInput(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MyButton(
                    height: 37,
                    width: 37,
                    icon: FontAwesomeIcons.sort,
                    onTap: () {},
                  ),
                ),
                MyButton(
                  height: 37,
                  width: 37,
                  icon: FontAwesomeIcons.slidersH,
                  onTap: () {},
                ),
              ],
            ),
          ),
          controller.obx((state) {
            List<StoreModel> listStores = state;
            return listStores.isNotEmpty
                ? ListViewPages(
                    children: listStores.map((e) {
                      return CardListView(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                        buttonDelete: true,
                        title: e.nameStore,
                        line1: 'Sala - ${e.numRoom}',
                        line2: 'Medidor - ${e.codMeter}',
                        onTapCard: () => Get.toNamed(
                          '/lojas/formulario_loja',
                          arguments: [
                            'Editar Loja',
                            false,
                            controller.storeNameController.text = e.nameStore,
                          ],
                        ).then(
                            (value) => controller.storeNameController.clear()),
                      );
                    }).toList(),
                  )
                : ListViewEmpty(
                    faIcon: FontAwesomeIcons.storeAlt,
                    message: 'Não a nenhuma loja cadastrada',
                    route: () =>
                        Get.toNamed('/lojas/formulario_loja', arguments: [
                      'Nova Loja',
                      true
                    ]).then((value) => controller.storeNameController.clear()),
                  );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/lojas/formulario_loja',
                arguments: ['Nova Loja', true])
            .then((value) => controller.storeNameController.clear()),
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}

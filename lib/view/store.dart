import 'package:controle_fornecedores/widgets/listViewEmpty.dart';
import 'package:controle_fornecedores/widgets/listViewPages.dart';
import 'package:controle_fornecedores/widgets/listViewStores.dart';
import 'package:controle_fornecedores/widgets/listViewStoresEmpty.dart';
import 'package:controle_fornecedores/widgets/myButton.dart';
import 'package:controle_fornecedores/widgets/myDrawer.dart';
import 'package:controle_fornecedores/widgets/searchInput.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Stores extends StatelessWidget {
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
          1 == 2
              ? ListViewPages(
                  children: [],
                )
              : ListViewEmpty(
                  faIcon: FontAwesomeIcons.storeAlt,
                  message: 'Não a nenhuma loja cadastrada',
                  route: '/formulario_loja',
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/nova_loja'),
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}

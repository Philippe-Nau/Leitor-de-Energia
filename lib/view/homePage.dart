import 'dart:ui';
import 'package:controle_fornecedores/controller/homeController.dart';
import 'package:controle_fornecedores/widgets/listViewEnergyReading.dart';
import 'package:controle_fornecedores/widgets/listViewEnergyReadingEmpty.dart';
import 'package:controle_fornecedores/widgets/myButton.dart';
import 'package:controle_fornecedores/widgets/myCircleAvatar.dart';
import 'package:controle_fornecedores/widgets/myDrawer.dart';
import 'package:controle_fornecedores/widgets/searchInput.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Leitura de Energia Elétrica"),
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
          1 == 1 ? ListViewEnergyReading() : ListViewEnergyReadingEmpty(),
        ],
      ),
    );
  }
}

import 'package:controle_fornecedores/controller/meterController.dart';
import 'package:controle_fornecedores/data/models/meterModel.dart';
import 'package:controle_fornecedores/widgets/cardListView.dart';
import 'package:controle_fornecedores/widgets/listViewEmpty.dart';
import 'package:controle_fornecedores/widgets/listViewPages.dart';
import 'package:controle_fornecedores/widgets/myAlertDialog.dart';
import 'package:controle_fornecedores/widgets/myButton.dart';
import 'package:controle_fornecedores/widgets/myDrawer.dart';
import 'package:controle_fornecedores/widgets/searchInput.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Meters extends GetView<MeterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Medidores"),
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
            List<MeterModel> listMeters = state;
            return listMeters.isNotEmpty
                ? ListViewPages(
                    children: listMeters.map((e) {
                      return CardListView(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                        buttonDelete: true,
                        title: e.codMeter,
                        line1: 'Sala - ${e.numRoom}',
                        line2: 'Loja - ${e.nameStore}',
                        onTapCard: () => Get.toNamed(
                          '/medidores/formulario_medidor',
                          arguments: [
                            'Editar medidor',
                            false,
                            controller.codMeterController.text = e.codMeter,
                            e.idMeter,
                          ],
                        ).then(
                            (value) => controller.codMeterController.clear()),
                        onPressedDelete: () => showDialog(
                          context: context,
                          builder: (ctx) => MyAlertDialog(
                            title: 'Excluir Medidor',
                            contentText:
                                'Tem certeza que deseja excluir este medidor?',
                            cancel: () => Get.back(),
                            confirm: () => controller.deleteMeter(e.idMeter),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : ListViewEmpty(
                    faIcon: FontAwesomeIcons.tachometerAlt,
                    message: 'Não a nenhum medidor cadastrado',
                    route: () => Get.toNamed('/medidores/formulario_medidor',
                            arguments: ['Novo Medidor', true])
                        .then((value) => controller.codMeterController.clear()),
                  );
          }, onError: (error) {
            return Text('Tivemos um problema. Entre em contato com o suporte');
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/medidores/formulario_medidor',
                arguments: ['Novo Medidor', true])
            .then((value) => controller.codMeterController.clear()),
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}

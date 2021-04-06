import 'package:controle_fornecedores/controller/meterController.dart';
import 'package:controle_fornecedores/controller/roomController.dart';
import 'package:controle_fornecedores/data/models/roomModel.dart';
import 'package:controle_fornecedores/widgets/cardListView.dart';
import 'package:controle_fornecedores/widgets/listViewEmpty.dart';
import 'package:controle_fornecedores/widgets/listViewPages.dart';
import 'package:controle_fornecedores/widgets/myButton.dart';
import 'package:controle_fornecedores/widgets/myDrawer.dart';
import 'package:controle_fornecedores/widgets/searchInput.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Rooms extends GetView<RoomController> {
  final MeterController _controllerMeter = Get.put(MeterController(Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Salas"),
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
            List<RoomModel> listRooms = state;
            return listRooms.isNotEmpty
                ? ListViewPages(
                    children: listRooms.map((e) {
                      return CardListView(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
                        title: 'Sala - ${e.numRoom}',
                        line1: e.nameStore,
                        line2: e.codMeter,
                        buttonDelete: true,
                        onTapCard: () => _controllerMeter.findFreeMeters().then(
                              (value) => Get.toNamed('/salas/formulario_sala',
                                  arguments: [
                                    'Nova Sala',
                                    true,
                                    controller.roomCodeController.text =
                                        e.numRoom.toString()
                                  ]).then((value) =>
                                  controller.roomCodeController.clear()),
                            ),
                      );
                    }).toList(),
                  )
                : ListViewEmpty(
                    faIcon: FontAwesomeIcons.storeAlt,
                    message: 'Não a nenhuma sala cadastrada',
                    route: () => _controllerMeter.findFreeMeters().then(
                          (value) => Get.toNamed('/salas/formulario_sala',
                                  arguments: ['Nova Sala', true])
                              .then((value) =>
                                  controller.roomCodeController.clear()),
                        ),
                  );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controllerMeter.findFreeMeters().then(
              (value) => Get.toNamed('/salas/formulario_sala',
                      arguments: ['Nova Sala', true])
                  .then((value) => controller.roomCodeController.clear()),
            ),
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}

import 'package:controle_fornecedores/controller/roomController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FormRoom extends GetView<RoomController> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final dynamic dataArguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataArguments[0]),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.check),
            onPressed: () => dataArguments[1]
                ? controller.postRoom(
                    _formKey,
                    controller.roomCodeController.text,
                    controller.selectedMeter.value,
                  )
                : controller.alterRoom(
                    _formKey,
                    dataArguments[2],
                    controller.selectedMeter.value == 0
                        ? dataArguments[3]
                        : controller.selectedMeter.value,
                    controller.roomCodeController.text,
                  ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.roomCodeController,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Número da Sala',
                  ),
                  validator: (validator) {
                    if (validator.trim().isEmpty)
                      return 'Este campo é obrigatório';
                    else
                      return null;
                  },
                ),
                SizedBox(height: 5),
                !dataArguments[1]
                    ? Text(
                        'Medidor Atual: ${dataArguments[4]}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  onChanged: (value) => controller.selectMeter(value.idMeter),
                  hint: Text('Selecione um medidor disponível'),
                  validator: (value) {
                    if (value == null && dataArguments[1])
                      return 'Este campo é obrigatório';
                    else
                      return null;
                  },
                  items: controller.freeMeterModel
                      .map((e) => DropdownMenuItem(
                            child: Text(e.codMeter),
                            value: e,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

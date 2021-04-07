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
                      controller.selectedMeter.value)
                  : null
              // : controller.alterMeter(_formKey, dataArguments[3],
              //     controller.codMeterController.text),
              ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
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
                SizedBox(height: 10),
                DropdownButtonFormField(
                  onChanged: (value) => controller.selectMeter(value.idMeter),
                  hint: Text('Selecione um medidor disponível'),
                  validator: (value) {
                    if (value == null)
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

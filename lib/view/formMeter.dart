import 'package:controle_fornecedores/controller/meterController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FormMeter extends GetView<MeterController> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final dynamic dataArguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataArguments[0] ?? ''),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.check),
            onPressed: () => dataArguments[1]
                ? controller.postMeter(
                    _formKey, controller.codMeterController.text)
                : controller.alterMeter(_formKey, dataArguments[3],
                    controller.codMeterController.text),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: controller.codMeterController,
              textInputAction: TextInputAction.send,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Código do Medidor',
              ),
              validator: (validator) {
                if (validator.trim().isEmpty)
                  return 'Este campo é obrigatório';
                else
                  return null;
              },
            ),
          ),
        ),
      ),
    );
  }
}

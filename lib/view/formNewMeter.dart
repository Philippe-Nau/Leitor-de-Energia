import 'package:controle_fornecedores/controller/formNewMeterController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FormNewMeter extends GetView<Formnewmetercontroller> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Medidor'),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.check),
            onPressed: () => controller.postMeter(
                _formKey, controller.codMeterController.text),
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

import 'package:controle_fornecedores/controller/formNewRoomController.dart';
import 'package:controle_fornecedores/controller/geralController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FormNewRoom extends GetView<FormNewRoomController> {
  final FormNewRoomController _controllerNewRoom =
      Get.put(FormNewRoomController());
  final GeralController _controller = Get.put(GeralController());
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Sala'),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.check),
            onPressed: () {
              if (_formKey.currentState.validate()) print('valido');
            },
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
                  controller: _controllerNewRoom.roomCodeController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'Código da Sala',
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
                  onChanged: (value) => _controller.selectMeter(value),
                  hint: Text('Selecione um medidor disponível'),
                  validator: (value) {
                    if (value == null)
                      return 'Este campo é obrigatório';
                    else
                      return null;
                  },
                  items: _controller.meters
                      .map((value) => DropdownMenuItem(
                            child: Text(value),
                            value: value,
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

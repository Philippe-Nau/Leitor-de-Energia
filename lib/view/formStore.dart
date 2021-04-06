import 'package:controle_fornecedores/controller/generalController.dart';
import 'package:controle_fornecedores/controller/storeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FormStore extends GetView<StoreController> {
  final GeralController _controller = Get.put(GeralController());
  final dynamic dataArguments = Get.arguments;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataArguments[0]),
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.storeNameController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Nome da Loja',
                ),
                validator: (validator) {
                  if (validator.trim().isEmpty)
                    return 'Este campo é obrigatório';
                  else
                    return null;
                },
              ),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Vincular Sala',
                      style: Theme.of(context).accentTextTheme.headline5,
                    ),
                    IconButton(
                      icon: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).accentColor,
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              DropdownButtonFormField(
                onChanged: (value) => _controller.selectRoom(value),
                hint: Text('Selecione uma sala disponível'),
                validator: (value) {
                  if (value == null)
                    return 'Este campo é obrigatório';
                  else
                    return null;
                },
                items: _controller.rooms
                    .map((value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ))
                    .toList(),
              ),
              SizedBox(height: 10),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Medidor',
                ),
                initialValue: _controller.meters[0],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 2, itemBuilder: (context, index) => null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

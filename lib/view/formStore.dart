import 'package:controle_fornecedores/controller/storeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FormStore extends GetView<StoreController> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              !dataArguments[1]
                  ? Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sala - ${dataArguments[2]}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Medidor: ${dataArguments[3]}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20),
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: DropdownButtonFormField(
                          validator: (value) {
                            if (value == null)
                              return 'Este campo é obrigatório';
                            else
                              return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          hint: Text('Selecione uma sala disponível'),
                          onChanged: (value) => controller.selectRoom(value),
                          items: controller.freeRoomsList
                              .map((e) => DropdownMenuItem(
                                    child: Text('Sala - ${e.numRoom}'),
                                    value: e,
                                  ))
                              .toList(),
                        ),
                      ),
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
              TextFormField(
                readOnly: true,
                controller: controller.codMeterController,
                decoration: InputDecoration(
                  labelText: 'Medidor',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Text(
                    index.toString(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

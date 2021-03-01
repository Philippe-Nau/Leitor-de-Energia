import 'package:controle_fornecedores/controller/formNewStoreController.dart';
import 'package:controle_fornecedores/widgets/myButton.dart';
import 'package:controle_fornecedores/widgets/myTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FormNewStore extends GetView<FormNewStoreController> {
  final FormNewStoreController _controller = Get.put(FormNewStoreController());
  final String _messageValidator = 'Este campo é obrigatório';
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Loja'),
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
                Container(
                  height: 120,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: _controller.personType.length,
                      itemBuilder: (ctx, index) => CheckboxListTile(
                        title: Text(_controller.personType[index].type),
                        value: _controller.personType[index].state,
                        onChanged: (value) =>
                            _controller.personTypeSelect(value, index),
                      ),
                    ),
                  ),
                ),
                MyTextFormField(
                  isReadOnly: false,
                  validator: (validator) {
                    if (validator.isEmpty)
                      return _messageValidator;
                    else
                      return null;
                  },
                  labelText: 'Empresa',
                  controller: _controller.companyNameController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                ),
                MyTextFormField(
                  isReadOnly: false,
                  validator: (validator) {
                    if (validator.isEmpty)
                      return _messageValidator;
                    else
                      return null;
                  },
                  labelText: 'Nome',
                  controller: _controller.supllierNameController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                ),
                MyTextFormField(
                  isReadOnly: false,
                  validator: (validator) {
                    if (validator.isEmpty)
                      return _messageValidator;
                    else
                      return null;
                  },
                  labelText: 'CPF/CNPJ',
                  controller: _controller.cpfCnpjController,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                ),
                Obx(
                  () => _controller.isNaturalPerson.value
                      ? MyTextFormField(
                          isReadOnly: false,
                          validator: (validator) {
                            if (validator.isEmpty)
                              return _messageValidator;
                            else
                              return null;
                          },
                          labelText: 'RG',
                          controller: _controller.rgController,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.number,
                        )
                      : SizedBox(),
                ),
                Obx(
                  () => _controller.isNaturalPerson.value
                      ? MyTextFormField(
                          isReadOnly: true,
                          onTap: () {
                            _controller.selectDate(context);
                          },
                          validator: (validator) {
                            if (validator.isEmpty)
                              return _messageValidator;
                            else
                              return null;
                          },
                          labelText: 'Nascimento',
                          controller: _controller.nascimentoController,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.datetime,
                        )
                      : SizedBox(),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MyTextFormField(
                        isReadOnly: false,
                        validator: _controller.validatorPhone,
                        labelText: 'Telefone',
                        controller: _controller.phoneController,
                        textInputAction: TextInputAction.send,
                        textInputType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: MyButton(
                        height: 50.5,
                        width: 50.5,
                        icon: FontAwesomeIcons.plus,
                        onTap: () => _controller
                            .addPhones(_controller.phoneController.text),
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => Container(
                    height: _controller.heigthListViewPhones.value,
                    constraints: BoxConstraints(maxHeight: 300),
                    child: ListView.builder(
                      itemCount: _controller.phones.length,
                      itemBuilder: (ctx, index) => Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _controller.phones[index],
                                ),
                                MyButton(
                                  height: 25,
                                  width: 25,
                                  icon: FontAwesomeIcons.minus,
                                  onTap: () => _controller.deletePhone(index),
                                )
                              ],
                            ),
                            Divider(
                              color: Theme.of(context).accentColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

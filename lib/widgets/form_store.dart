import 'package:controle_fornecedores/controller/formNewStoreController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormStore extends StatelessWidget {
  final _formStoreController = Get.put(FormNewStoreController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CheckboxListTile(
            title: Text('Pessoa Física'),
            value: false,
            onChanged: (_) {},
          ),
          CheckboxListTile(
            title: Text('Pessoa Jurídica'),
            value: false,
            onChanged: (_) {},
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Empresa'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Nome'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'CPF/CNPJ'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'RG'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Data de Nascimento'),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _formStoreController.phoneController,
                  decoration: InputDecoration(labelText: 'Telefone'),
                ),
              ),
              InkWell(
                onTap: () => _formStoreController.addPhones,
                child: Icon(Icons.add_box),
              )
            ],
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _formStoreController.phones.length,
                itemBuilder: (context, index) =>
                    Text(_formStoreController.phones[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

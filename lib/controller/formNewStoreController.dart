import 'package:controle_fornecedores/model/typePerson.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormNewStoreController extends GetxController {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController supllierNameController = TextEditingController();
  TextEditingController cpfCnpjController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController nascimentoController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final RxList<TypePerson> personType = [
    TypePerson(state: true, type: 'Pessoa Jurídica'),
    TypePerson(state: false, type: 'Pessoa Fisíca'),
  ].obs;

  final RxList phones = [].obs;
  final RxBool isNaturalPerson = false.obs;
  final DateTime _currentDate = DateTime.now();

  RxDouble heigthListViewPhones = 0.0.obs;

  personTypeSelect(bool value, int index) {
    for (var i = 0; i < personType.length; i++) {
      if (i == index)
        personType[index].state = true;
      else
        personType[i].state = false;

      if (personType[i].type == 'Pessoa Fisíca' && personType[i].state)
        isNaturalPerson.value = true;
      else
        isNaturalPerson.value = false;
      personType.refresh();
    }
  }

  String validatorPhone(String value) {
    if (phones.isEmpty) {
      if (phoneController.text.trim().isEmpty)
        return 'Obrigatório telefone para contato';
      else if (!phoneController.text.isPhoneNumber)
        return 'O telefone informado é inválido';
      else {
        addPhones(phoneController.text);
        return null;
      }
    } else {
      if (phoneController.text.trim().isNotEmpty &&
          !phoneController.text.isPhoneNumber)
        return 'O telefone informado é inválido';
      else {
        addPhones(phoneController.text);
        return null;
      }
    }
  }

  addPhones(String phoneNumber) {
    if (phoneController.text.trim().isNotEmpty &&
        phoneController.text.isPhoneNumber) {
      phones.add(phoneNumber);
      heigthListViewPhones.value = heigthListViewPhones.value + 45;
      phoneController.clear();
    }
  }

  deletePhone(int index) {
    phones.removeAt(index);
    if (heigthListViewPhones.value < 0)
      heigthListViewPhones.value = heigthListViewPhones.value - 45;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
      confirmText: 'Ok',
      cancelText: 'Cancelar',
      context: context,
      initialDate: _currentDate,
      firstDate: DateTime(_currentDate.year - 100),
      lastDate: _currentDate,
      builder: (context, child) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light().copyWith(
            primary: Color(0xFF91131C),
          ),
        ),
        child: child,
      ),
    );

    if (pickedDate != null && pickedDate != _currentDate)
      nascimentoController.text =
          ('${pickedDate.day}/' + '${pickedDate.month}/' + '${pickedDate.year}')
              .toString();
  }
}

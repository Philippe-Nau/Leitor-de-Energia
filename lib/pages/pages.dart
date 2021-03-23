import 'package:controle_fornecedores/data/bindings/metersBinding.dart';
import 'package:controle_fornecedores/data/bindings/newMeterBinding.dart';
import 'package:controle_fornecedores/routes/routes.dart';
import 'package:controle_fornecedores/view/formNewMeter.dart';
import 'package:controle_fornecedores/view/formNewRoom.dart';
import 'package:controle_fornecedores/view/formNewStore.dart';
import 'package:controle_fornecedores/view/meters.dart';
import 'package:controle_fornecedores/view/reading_energy.dart';
import 'package:controle_fornecedores/view/rooms.dart';
import 'package:controle_fornecedores/view/store.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.READINGENERGY,
      page: () => ReadingEnergy(),
    ),
    GetPage(
      name: Routes.STORES,
      page: () => Stores(),
    ),
    GetPage(
      name: Routes.FORMNEWUSTORE,
      page: () => FormNewStore(),
    ),
    GetPage(
      name: Routes.ROOMS,
      page: () => Rooms(),
    ),
    GetPage(
      name: Routes.FORMNEWROOM,
      page: () => FormNewRoom(),
    ),
    GetPage(
      name: Routes.METERS,
      page: () => Meters(),
      binding: Metersbinding(),
      children: [
        GetPage(
          name: Routes.FORMNEWMETER,
          page: () => FormNewMeter(),
          binding: Newmeterbinding(),
        ),
      ],
    ),
  ];
}

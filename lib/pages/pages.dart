import 'package:controle_fornecedores/data/bindings/metersBinding.dart';
import 'package:controle_fornecedores/data/bindings/roomsBinding.dart';
import 'package:controle_fornecedores/data/bindings/storeBinding.dart';
import 'package:controle_fornecedores/routes/routes.dart';
import 'package:controle_fornecedores/view/formMeter.dart';
import 'package:controle_fornecedores/view/formStore.dart';
import 'package:controle_fornecedores/view/formRoom.dart';
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
      binding: Storesbinding(),
      children: [
        GetPage(
          name: Routes.FORMSTORE,
          page: () => FormStore(),
        ),
      ],
    ),
    GetPage(
      name: Routes.ROOMS,
      page: () => Rooms(),
      binding: Roomsbinding(),
      children: [
        GetPage(
          name: Routes.FORMROOM,
          binding: Roomsbinding(),
          page: () => FormRoom(),
        ),
      ],
    ),
    GetPage(
      name: Routes.METERS,
      page: () => Meters(),
      binding: Metersbinding(),
      children: [
        GetPage(
          name: Routes.FORMMETER,
          page: () => FormMeter(),
          binding: Metersbinding(),
        ),
      ],
    ),
  ];
}

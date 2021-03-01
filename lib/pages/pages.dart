import 'package:controle_fornecedores/routes/routes.dart';
import 'package:controle_fornecedores/view/formNewStore.dart';
import 'package:controle_fornecedores/view/homePage.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.FORMNEWUSTORE,
      page: () => FormNewStore(),
    ),
  ];
}

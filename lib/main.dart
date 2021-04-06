import 'package:controle_fornecedores/data/bindings/storeBinding.dart';
import 'package:controle_fornecedores/pages/pages.dart';
import 'package:controle_fornecedores/routes/routes.dart';
import 'package:controle_fornecedores/view/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(EnergyReading());
}

class EnergyReading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF006DB8),
        accentColor: Color(0xFF5580BF),
        buttonColor: Color(0xFF8AAEE4),
        dialogTheme: DialogTheme(
          contentTextStyle: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
        ),
        accentTextTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.grey[700],
          ),
          headline5: TextStyle(
            color: Colors.grey[700],
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      title: 'Leitura de Energia Elétrica',
      initialRoute: Routes.STORES,
      getPages: AppPages.pages,
      initialBinding: Storesbinding(),
      home: Stores(),
    );
  }
}

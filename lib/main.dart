import 'package:controle_fornecedores/pages/pages.dart';
import 'package:controle_fornecedores/routes/routes.dart';
import 'package:controle_fornecedores/view/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() {
  runApp(SuppliersControl());
}

class SuppliersControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Get.deviceLocale],
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF006DB8),
        accentColor: Color(0xFF5580BF),
        accentTextTheme:
            TextTheme(headline3: TextStyle(color: Colors.grey[700])),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      title: 'Leitura de Energia Elétrica',
      initialRoute: Routes.INITIAL,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      locale: Locale('pt', 'BR'),
      home: HomePage(),
    );
  }
}

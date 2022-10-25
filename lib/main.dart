import 'package:flutter/material.dart';
import 'package:macro_projeto/temas/app_colors.dart';

import 'Modulos/login/login_page.dart';
import 'Modulos/splash_page.dart/splash_page.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rastreio',
      theme: ThemeData(
          primarySwatch: Colors.green, primaryColor: AppColors.primary),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashPage(),
        // "/home": (context) => const HomePage(name: a,),
        "/login": (context) => const LoginPage(),
        // // "/barcode_teste": (context) => BarcodeScannerTeste(),
        // "/module": (context) => Modulo(),
      },
    );
  }
}

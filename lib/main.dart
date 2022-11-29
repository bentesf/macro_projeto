import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/database/base.dart';
import 'package:macro_projeto/Modulos/home/home_controller.dart';
import 'package:macro_projeto/Modulos/splash_page.dart/splash_page.dart';
import 'package:macro_projeto/shared/auth/auth_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  // runApp(const AppWidget());
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebase
      );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthController()),
      ChangeNotifierProvider(
        create: (context) => ContactDao(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeController(),
      )
    ],
    child: const SplashPage(),
  ));
}

// class AppWidget extends StatelessWidget {
//   const AppWidget({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rastreio',
//       theme: ThemeData(
//           primarySwatch: Colors.blue, primaryColor: AppColors.primary),
//       initialRoute: "/splash",
//       routes: {
//         "/splash": (context) => const SplashPage(),
//         // "/home": (context) => const HomePage(
//         //       name: "teste",
//         // ),
//         "/login": (context) => const LoginPage(),
//       },
//     );
//   }
// }

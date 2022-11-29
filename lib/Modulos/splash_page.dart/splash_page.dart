import 'package:flutter/material.dart';
import 'package:macro_projeto/shared/auth/auth_service.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AuthService auth =
    // final authController = AuthController();
    // authController.currentUser(context);
    return MaterialApp(
      title: 'Macro Projeto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const AuthServiceCheck(),
    );
  }
}

// import 'package:flutter/material.dart';

// class MeuAplicativo extends StatelessWidget {
//   const MeuAplicativo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cripto Moedas',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//       ),
//       home: AuthCheck(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:macro_projeto/temas/app_images.dart';

import '../../shared/auth/auth_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 122, 122, 122),
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(171, 0, 0, 0),
              ],
            ),
          ),
          child: Center(
            child: Image.asset(
              AppImages.logogif,
              width: 200,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 202, 202, 202),
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(148, 255, 255, 255),
                // Color.fromARGB(83, 0, 0, 0),
              ],
            ),
          ),
          child: Center(
            child: Image.asset(
              AppImages.industria,
              width: 300,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}

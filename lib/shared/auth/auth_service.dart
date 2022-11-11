import 'package:flutter/material.dart';
import 'package:macro_projeto/shared/auth/auth_controller.dart';
import 'package:macro_projeto/temas/app_images.dart';
import 'package:provider/provider.dart';

import '../../Modulos/home/home_page.dart';
import '../../Modulos/login/login_page.dart';

class AuthServiceCheck extends StatefulWidget {
  const AuthServiceCheck({super.key});

  @override
  State<AuthServiceCheck> createState() => _AuthServiceState();
}

class _AuthServiceState extends State<AuthServiceCheck> {
  @override
  Widget build(BuildContext context) {
    AuthController auth = Provider.of<AuthController>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const LoginPage();
    } else {
      return const HomePage();
    }
  }

  loading() {
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
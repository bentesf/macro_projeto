// ignore_for_file: avoid_print

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:macro_projeto/Modulos/service/login_api.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  late final List<String> teste;

  late BuildContext context;

  String? validateUser(String? name) {
    if (name!.isEmpty) {
      return "Digite o Login";
    }
    return null;
  }

  String? validateSenha(String? senha) {
    if (senha!.isEmpty) {
      return "Digite o Senha";
    }
    return null;
  }

  Future<String?> login(String user, String passw) async {
    final name = await LoginApi.login(user, passw);

    if (name!.isEmpty || name == 'Erro') {
      return 'Erro';
    } else {
      return name;
    }
  }
}

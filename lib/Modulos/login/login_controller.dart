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
  // Future<List<Usuario>> getContacts() async {
  //   try {
  //     final Database db = await getDatabase();
  //     final List<Map<String, dynamic>> maps = await db.query('usuario');

  //     return List.generate(
  //       maps.length,
  //       (i) {
  //         return Usuario.fromMap(maps[i]);
  //       },
  //     );
  //   } catch (ex) {
  //     print(ex);
  //     return <Usuario>[];
  //   }
  // }

  // Future create(Usuario user) async {
  //   try {
  //     final Database db = await getDatabase();

  //     await db.insert(
  //       'usuario',
  //       user.toMap(),
  //     );
  //   } catch (ex) {
  //     print(ex);
  //     return;
  //   }
  // }
// }

// ignore_for_file: avoid_print

// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:macro_projeto/Modulos/database/base.dart';
import 'package:macro_projeto/shared/models/user_model.dart';

class LoginApi {
  static Future<String?> login(String user, String password) async {
    List<Usuario> result = ContactDao().find(user) as List<Usuario>;
    result[0];
    return null;
  }
}

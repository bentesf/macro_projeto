import 'package:flutter/material.dart';
import 'package:macro_projeto/shared/models/user_model.dart';

class AuthController {
  Usuario? _name;
  Usuario get user => _name!;

  void setUser(BuildContext context, Usuario? name) {
    if (name != null) {
      Navigator.pushReplacementNamed(context, "/home", arguments: name);
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> currentUser(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 6));
    // ignore: use_build_context_synchronously
    setUser(context, null);
  }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthController extends ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? usuario;
  // Usuario get user => _name!;
  bool isLoading = true;

  AuthController(){
    Future.delayed(const Duration(seconds: 5));
    _authCheck();
  }

  _authCheck(){
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
     });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String login, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: login, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      }
    }
  }

  login(String login, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: login, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }

}

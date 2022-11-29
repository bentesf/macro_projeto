import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:macro_projeto/shared/auth/auth_controller.dart';

import '../database/db_firestore.dart';

class HomeController extends ChangeNotifier {
  late FirebaseFirestore db;
  late AuthController auth;
  late String teste;

  HomeController() {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    // await readFavoritas();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  Future<dynamic> readFavoritas() async {
    // if (auth.usuario != null) {
    // var collection = db.collection('usuarios/${auth.usuario!.uid}/dados');
    // var result = await collection.get();
    // String nome2;
    // for (var doc in result.docs) {
    //   var nome = doc.data().toString().contains('nome') ? doc.get('nome') : '';
    //   return nome.toString();
    //   // doc.data().toString().contains('name') ? doc.get('id') : '';
    // }
    // teste = ;
    // }
    // return result;
  }

  var currentPage = 0;

  void setPage(int index) {
    currentPage = index;
  }

  Future<String> favoritas() async {
    return "";
  }
}

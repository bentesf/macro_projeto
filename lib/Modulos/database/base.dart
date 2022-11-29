import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:macro_projeto/shared/auth/auth_controller.dart';
import 'package:macro_projeto/shared/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class ContactDao extends ChangeNotifier {
  static const String _tableUser = 'local';
  static const String _descri = 'descri';
  static const String _area = 'area';
  static const String _cap = 'cap';
  late FirebaseFirestore db;
  late AuthController auth;

  // ContactDao() {
  //   _startRepository();
  // }

  // _startRepository() async {
  //   await _startFirestore();
  // }

  // _startFirestore() {
  //   db = DBFirestore.get();
  // }

//SALVAR OU ALTERAR OS DADOS
  Future save(Usuario usuarios) async {
    final Database db = await DBHelper().getDatabase();

    var exist = await find(usuarios.descri);
    Map<String, dynamic> usuariosMap = _toMap(usuarios);
    // await db
    // .collection('usuarios/${auth.usuario!.uid}/dados')
    // .doc()
    // .set(usuariosMap);
    if (exist.isEmpty) {
      return db.insert(_tableUser, usuariosMap);
    } else {
      return db.update(
        'local',
        usuariosMap,
        where: '$_descri = ?',
        whereArgs: [usuarios.descri],
      );
    }
  }

//BUSCAR TODOS OS DADOS
  Future<List<Usuario>> findAll() async {
    final Database db = await DBHelper().getDatabase();

    final List<Map<String, dynamic>> result = await db.query(_tableUser);
    List<Usuario> usuarios = _toList(result);
    return usuarios;
  }

//BUSCAR UM DADOS ESPECCIFICOS
  Future<List<Usuario>> find(String descri) async {
    final Database db = await DBHelper().getDatabase();

    final List<Map<String, dynamic>> result = await db.query(
      _tableUser,
      where: '$_descri = ?',
      whereArgs: [descri],
    );
    List<Usuario> usuarios = _toList(result);
    return usuarios;
  }

//CONVERTE UM LIST PARA UM MAP
  Map<String, dynamic> _toMap(Usuario usuario) {
    final Map<String, dynamic> usuarioMap = {};
    usuarioMap[_descri] = usuario.descri;
    usuarioMap[_area] = usuario.area;
    usuarioMap[_cap] = usuario.cap;
    return usuarioMap;
  }

//CONVERTE O MAP PARA UMA LISTA
  List<Usuario> _toList(List<Map<String, dynamic>> result) {
    final List<Usuario> usuarios = [];
    for (Map<String, dynamic> row in result) {
      final Usuario usuario = Usuario(
        row[_descri],
        row[_area],
        row[_cap],
      );
      usuarios.add(usuario);
    }
    return usuarios;
  }

//DELETAR DADOS
  delete(String descri) async {
    final Database db = await DBHelper().getDatabase();

    return db.delete(
      _tableUser,
      where: '$_descri = ?',
      whereArgs: [descri],
    );
  }
}

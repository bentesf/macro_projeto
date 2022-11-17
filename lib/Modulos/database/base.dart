import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:macro_projeto/shared/auth/auth_controller.dart';
import 'package:macro_projeto/shared/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';
import 'db_firestore.dart';

class ContactDao extends ChangeNotifier {
  static const String _tableUser = 'usuario';
  static const String _nome = 'nome';
  static const String _perfil = 'perfil';
  late FirebaseFirestore db;
  late AuthController auth;

  ContactDao({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

//SALVAR OU ALTERAR OS DADOS
  Future save(Usuario usuarios) async {
    //  final Database db = await DBHelper().getDatabase();

    // var exist = await find(produto.id);
    Map<String, dynamic> usuariosMap = _toMap(usuarios);
    await db
        .collection('usuarios/${auth.usuario!.uid}/dados')
        .doc()
        .set(usuariosMap);
    // if (exist.isEmpty) {
    //   return db.insert(_tableProd, produtoMap);
    // } else {
    //   return db.update(
    //     'produto',
    //     produtoMap,
    //     where: '$_id = ?',
    //     whereArgs: [produto.id],
    //   );
    // }
  }

//BUSCAR TODOS OS DADOS
  Future<List<Usuario>> findAll() async {
    final Database db = await DBHelper().getDatabase();

    final List<Map<String, dynamic>> result = await db.query(_tableUser);
    List<Usuario> usuarios = _toList(result);
    return usuarios;
  }

//BUSCAR UM DADOS ESPECCIFICOS
  Future<List<Usuario>> find(String nome) async {
    final Database db = await DBHelper().getDatabase();

    final List<Map<String, dynamic>> result = await db.query(
      _tableUser,
      where: '$_nome = ?',
      whereArgs: [nome],
    );
    List<Usuario> usuarios = _toList(result);
    return usuarios;
  }

//CONVERTE UM LIST PARA UM MAP
  Map<String, dynamic> _toMap(Usuario usuario) {
    final Map<String, dynamic> usuarioMap = {};
    usuarioMap[_nome] = usuario.nome;
    usuarioMap[_perfil] = usuario.perfil;
    return usuarioMap;
  }

//CONVERTE O MAP PARA UMA LISTA
  List<Usuario> _toList(List<Map<String, dynamic>> result) {
    final List<Usuario> usuarios = [];
    for (Map<String, dynamic> row in result) {
      final Usuario usuario = Usuario(
        row[_nome],
        row[_perfil],
      );
      usuarios.add(usuario);
    }
    return usuarios;
  }

//DELETAR DADOS
  delete(String nome) async {
    final Database db = await DBHelper().getDatabase();

    return db.delete(
      _tableUser,
      where: '$_nome = ?',
      whereArgs: [nome],
    );
  }
}

import 'package:macro_projeto/shared/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_nome TEXT, '
      '$_email TEXT, '
      '$_senha TEXT, '
      '$_perfil TEXT)';
  static const String _tableName = 'usuario';
  static const String _nome = 'nome';
  static const String _email = 'email';
  static const String _senha = 'senha';
  static const String _perfil = 'perfil';

//SALVAR OU ALTERAR OS DADOS
  Future<int> save(Usuario usuario) async {
    final Database db = await getDatabase();
    var exist = await find(usuario.nome);
    Map<String, dynamic> usuarioMap = _toMap(usuario);
    if (exist.isEmpty) {
      return db.insert(_tableName, usuarioMap);
    } else {
      return db.update(
        _tableName,
        usuarioMap,
        where: '$_nome = ?',
        whereArgs: [usuario.nome],
      );
    }
  }

//BUSCAR TODOS OS DADOS
  Future<List<Usuario>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Usuario> usuarios = _toList(result);
    return usuarios;
  }

//BUSCAR UM DADOS ESPECCIFICOS
  Future<List<Usuario>> find(String nome) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
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
    usuarioMap[_email] = usuario.email;
    usuarioMap[_senha] = usuario.senha;
    usuarioMap[_perfil] = usuario.perfil;
    return usuarioMap;
  }

//CONVERTE O MAP PARA UMA LISTA
  List<Usuario> _toList(List<Map<String, dynamic>> result) {
    final List<Usuario> usuarios = [];
    for (Map<String, dynamic> row in result) {
      final Usuario usuario = Usuario(
        row[_nome],
        row[_email],
        row[_senha],
        row[_perfil],
      );
      usuarios.add(usuario);
    }
    return usuarios;
  }

//DELETAR DADOS
  delete(String nome) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: '$_nome = ?',
      whereArgs: [nome],
    );
  }
}
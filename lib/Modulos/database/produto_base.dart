import 'package:macro_projeto/shared/models/produto_model.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class ProdutoDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id TEXT, '
      '$_descricao TEXT, '
      '$_aplicacao TEXT, '
      '$_fornecedor TEXT)'
      '$_classificacao TEXT)'
      '$_perigos TEXT)'
      '$_tipo TEXT)'
      '$_nomquimico TEXT)'
      '$_impurezas TEXT)'
      '$_cas TEXT)'
      '$_concentracao TEXT)';
  static const String _tableName = 'produto';
  static const String _id = 'id';
  static const String _descricao ='descricao';
  static const String _aplicacao ='aplicacao';
  static const String _fornecedor ='fornecedor';
  static const String _classificacao ='classificacao';
  static const String _perigos ='perigos';
  static const String _tipo ='tipo';
  static const String _nomquimico ='nomquimico';
  static const String _impurezas ='impurezas';
  static const String _cas ='cas';
  static const String _concentracao ='concentracao';

//SALVAR OU ALTERAR OS DADOS
  Future<int> save(Produto produto) async {
    final Database db = await getDatabase();
    var exist = await find(produto.id);
    Map<String, dynamic> produtoMap = _toMap(produto);
    if (exist.isEmpty) {
      return db.insert(_tableName, produtoMap);
    } else {
      return db.update(
        _tableName,
        produtoMap,
        where: '$_id = ?',
        whereArgs: [produto.id],
      );
    }
  }

//BUSCAR TODOS OS DADOS
  Future<List<Produto>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Produto> produtos = _toList(result);
    return produtos;
  }

//BUSCAR UM DADOS ESPECCIFICOS
  Future<List<Produto>> find(String id) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_id = ?',
      whereArgs: [id],
    );
    List<Produto> produtos = _toList(result);
    return produtos;
  }

//CONVERTE UM LIST PARA UM MAP
  Map<String, dynamic> _toMap(Produto produto) {
    final Map<String, dynamic> produtoMap = {};
      produtoMap[_id]= produto.id;
      produtoMap[_descricao]= produto.descricao;
      produtoMap[_aplicacao]= produto.aplicacao;
      produtoMap[_fornecedor]= produto.fornecedor;
      produtoMap[_classificacao]= produto.classificacao;
      produtoMap[_perigos]= produto.perigos;
      produtoMap[_tipo]= produto.tipo;
      produtoMap[_nomquimico]= produto.nomquimico;
      produtoMap[_impurezas]= produto.impurezas;
      produtoMap[_cas]= produto.cas;
      produtoMap[_concentracao]= produto.concentracao;
    return produtoMap;
  }

//CONVERTE O MAP PARA UMA LISTA
  List<Produto> _toList(List<Map<String, dynamic>> result) {
    final List<Produto> produtos = [];
    for (Map<String, dynamic> row in result) {
      final Produto produto = Produto(
      row[_id],
      row[_descricao],
      row[_aplicacao],
      row[_fornecedor],
      row[_classificacao],
      row[_perigos],
      row[_tipo],
      row[_nomquimico],
      row[_impurezas],
      row[_cas],
      row[_concentracao],
      );
      produtos.add(produto);
    }
    return produtos;
  }

//DELETAR DADOS
  delete(String id) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: '$_id = ?',
      whereArgs: [id],
    );
  }
}

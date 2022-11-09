import 'package:macro_projeto/Modulos/database/app_database.dart';
import 'package:macro_projeto/shared/models/produto_model.dart';
import 'package:sqflite/sqflite.dart';


class ProdutoDao {

  static const String _tableProd = 'produto';
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
  Future save(Produto produto) async {
     final Database db = await DBHelper().getDatabase();
    var exist = await find(produto.id);
    Map<String, dynamic> produtoMap = _toMap(produto);
    if (exist.isEmpty) {
      return db.insert(_tableProd, produtoMap);
    } else {
      return db.update(
        'produto',
        produtoMap,
        where: '$_id = ?',
        whereArgs: [produto.id],
      );
    }
  }

//contagen
  Future<int> countAll() async {
     final Database db = await DBHelper().getDatabase();

    final List<Map<String, dynamic>> result = await db.query(_tableProd);
    List<Produto> produtos = _toList(result);
    return produtos.length;
  }
//BUSCAR TODOS OS DADOS
  Future<List<Produto>> findAll() async {
     final Database db = await DBHelper().getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableProd);
    List<Produto> produtos = _toList(result);
    return produtos;
  }
//BUSCAR UM DADOS ESPECIFICOS
  Future<List<Produto>> find(String id) async {
     final Database db = await DBHelper().getDatabase();

    final List<Map<String, dynamic>> result = await db.query(
      _tableProd,
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
      final Database db = await DBHelper().getDatabase();

    return db.delete(
      _tableProd,
      where: '$_id = ?',
      whereArgs: [id],
    );
  }
}

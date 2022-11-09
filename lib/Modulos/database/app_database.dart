import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const String _nomeDB = "controle.db";
  static const int _versaoDB = 1;

  static const String _tableUser = 'usuario';
  static const String _nome = 'nome';
  static const String _email = 'email';
  static const String _senha = 'senha';
  static const String _perfil = 'perfil';

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


  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _nomeDB),
      onCreate:_criarBanco,
      version: _versaoDB,
    );
  }
  Future<void> _criarBanco(Database db, int novaVersao) async {

    List<String> queryes = [
      'CREATE TABLE $_tableProd('
      '$_id TEXT, '
      '$_descricao TEXT, '
      '$_aplicacao TEXT, '
      '$_fornecedor TEXT, '
      '$_classificacao TEXT, '
      '$_perigos TEXT, '
      '$_tipo TEXT, '
      '$_nomquimico TEXT, '
      '$_impurezas TEXT, '
      '$_cas TEXT, '
      '$_concentracao TEXT) ',
      'CREATE TABLE $_tableUser('
      '$_nome TEXT, '
      '$_email TEXT, '
      '$_senha TEXT, '
      '$_perfil TEXT)'
    ];

    for (String query in queryes) {
      await db.execute(query);
    }
  }
}

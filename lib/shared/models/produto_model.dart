class Produto {
  final String id;
  final String descricao;
  final String aplicacao;
  final String fornecedor;
  final String classificacao;
  final String perigos;
  final String tipo;
  final String nomquimico;
  final String impurezas;
  final String cas;
  final String concentracao;
  final String local;

  Produto(
      this.id,
      this.descricao,
      this.aplicacao,
      this.fornecedor,
      this.classificacao,
      this.perigos,
      this.tipo,
      this.nomquimico,
      this.impurezas,
      this.cas,
      this.concentracao,
      this.local);

  Map<String, dynamic> toMap(Produto produto) {
    return {
      'id': id,
      'descricao': descricao,
      'aplicacao': aplicacao,
      'fornecedor': fornecedor,
      'classificacao': classificacao,
      'perigos': perigos,
      'tipo': tipo,
      'nomquimico': nomquimico,
      'impurezas': impurezas,
      'cas': cas,
      'concentracao': concentracao,
      'local': local,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      map['id'],
      map['descricao'],
      map['aplicacao'],
      map['fornecedor'],
      map['classificacao'],
      map['perigos'],
      map['tipo'],
      map['nomquimico'],
      map['impurezas'],
      map['cas'],
      map['concentracao'],
      map['local'],
    );
  }

  factory Produto.fromJson(Map<String, dynamic> json) => Produto.fromMap(json);
}

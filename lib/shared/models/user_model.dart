class Usuario {
  final String nome;
  final String perfil;

  Usuario(
    this.nome,
    this.perfil,
  );

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'perfil': perfil,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(map['nome'], map['perfil']);
  }

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario.fromMap(json);
}

class Usuario {
  final String nome;
  final String email;
  final String senha;
  final String perfil;

  Usuario(
    this.nome,
    this.email,
    this.senha,
    this.perfil,
  );

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
      'perfil': perfil,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(map['nome'], map['email'], map['senha'], map['perfil']);
  }

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario.fromMap(json);
}

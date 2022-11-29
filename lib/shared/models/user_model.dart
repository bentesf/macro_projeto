class Usuario {
  final String descri;
  final String area;
  final String cap;

  Usuario(
    this.descri,
    this.area,
    this.cap,
  );

  Map<String, dynamic> toMap() {
    return {
      'descri': descri,
      'area': area,
      'cap': cap,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(map['descri'], map['area'], map['cap']);
  }

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario.fromMap(json);
}

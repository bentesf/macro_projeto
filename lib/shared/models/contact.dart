class ContactModel {
  String carga = "";
  String data = "";
  String volume = "";

  ContactModel({
    required this.carga,
    required this.data,
    required this.volume,
  });

  Map<String, dynamic> toMap() {
    return {
      'carga': carga,
      'data': data,
      'volume': volume,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(carga: map['carga'], data: map['data'], volume: map['volume']);
  }

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      ContactModel.fromMap(json);
}

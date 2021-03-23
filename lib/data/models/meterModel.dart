import 'dart:convert';

class MeterModel {
  int idMeter;
  String codMeter;

  MeterModel({this.idMeter, this.codMeter});

  Map<String, dynamic> toMap() {
    return {
      'idMeter': idMeter,
      'codMeter': codMeter,
    };
  }

  factory MeterModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MeterModel(
      idMeter: map['idMeter'] ?? '',
      codMeter: map['codMeter'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MeterModel.fromJson(String source) =>
      MeterModel.fromMap(json.decode(source));
}

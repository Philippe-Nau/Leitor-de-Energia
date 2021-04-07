import 'dart:convert';

class MeterModel {
  int idMeter;
  String numRoom;
  String nameStore;
  String codMeter;

  MeterModel({this.idMeter, this.codMeter, this.nameStore, this.numRoom});

  Map<String, dynamic> toMap() {
    return {
      'idMeter': idMeter,
      'codMeter': codMeter,
      'numRoom': numRoom,
      'nameStore': nameStore,
    };
  }

  factory MeterModel.fromMap(Map<String, dynamic> map) {
    return MeterModel(
      idMeter: map['idMeter'],
      codMeter: map['codMeter'],
      numRoom: map['numRoom'] ?? '0',
      nameStore: map['nameStore'] ?? 'Livre',
    );
  }

  String toJson() => json.encode(toMap());

  factory MeterModel.fromJson(String source) =>
      MeterModel.fromMap(json.decode(source));
}

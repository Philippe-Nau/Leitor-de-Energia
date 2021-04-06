class FreeMeterModel {
  int idMeter;
  String codMeter;

  FreeMeterModel({this.idMeter, this.codMeter});

  Map<String, dynamic> toMap() {
    return {
      'idMeter': idMeter,
      'codMeter': codMeter,
    };
  }

  factory FreeMeterModel.fromMap(Map<String, dynamic> map) {
    return FreeMeterModel(
      idMeter: map['idMeter'],
      codMeter: map['codMeter'],
    );
  }
}

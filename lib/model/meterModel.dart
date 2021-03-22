class MeterModel {
  int idMeter;
  String codMeter;

  MeterModel({this.idMeter, this.codMeter});

  MeterModel.fromJson(Map<String, dynamic> json) {
    this.idMeter = json['idMeter'];
    this.codMeter = json['codMeter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMeter'] = this.idMeter;
    data['codMeter'] = this.codMeter;
    return data;
  }
}

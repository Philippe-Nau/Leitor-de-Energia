class MeterModel {
  List meters;

  MeterModel({this.meters});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meters != null) {
      data['meters'] = this.meters.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meters {
  String idMeter;
  String codMeter;

  Meters({this.idMeter, this.codMeter});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMeter'] = this.idMeter;
    data['codMeter'] = this.codMeter;
    return data;
  }
}

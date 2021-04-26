class FreeRoomModel {
  int idRoom;
  int idMeter;
  String numRoom;
  String codMeter;

  FreeRoomModel({this.idRoom, this.idMeter, this.numRoom, this.codMeter});

  Map<String, dynamic> toMap() {
    return {
      'idRoom': idRoom,
      'idMeter': idMeter,
      'numRoom': numRoom,
      'codMeter': codMeter,
    };
  }

  factory FreeRoomModel.fromMap(Map<String, dynamic> map) {
    return FreeRoomModel(
      idRoom: map['idRoom'],
      idMeter: map['idMeter'],
      numRoom: map['numRoom'],
      codMeter: map['codMeter'],
    );
  }
}

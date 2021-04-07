class RoomModel {
  final int idRoom;
  final String numRoom;
  final String codMeter;
  final String nameStore;

  RoomModel({this.idRoom, this.numRoom, this.codMeter, this.nameStore});

  Map<String, dynamic> toMap() {
    return {
      'idRoom': idRoom,
      'numRoom': numRoom,
      'codMeter': codMeter,
      'nameStore': nameStore,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      idRoom: map['idRoom'],
      numRoom: map['numRoom'],
      codMeter: map['codMeter'],
      nameStore: map['nameStore'] ?? 'Livre',
    );
  }
}

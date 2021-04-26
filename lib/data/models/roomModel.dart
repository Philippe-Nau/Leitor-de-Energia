class RoomModel {
  final int idRoom;
  final int idMeter;
  final String numRoom;
  final String codMeter;
  final String nameStore;

  RoomModel(
      {this.idRoom, this.idMeter, this.numRoom, this.codMeter, this.nameStore});

  Map<String, dynamic> toMap() {
    return {
      'idRoom': idRoom,
      'idMeter': idMeter,
      'numRoom': numRoom,
      'codMeter': codMeter,
      'nameStore': nameStore,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      idRoom: map['idRoom'],
      idMeter: map['idMeter'],
      numRoom: map['numRoom'],
      codMeter: map['codMeter'],
      nameStore: map['nameStore'] ?? 'Livre',
    );
  }
}

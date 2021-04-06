class StoreModel {
  final int idStore;
  final int numRoom;
  final String nameStore;
  final String codMeter;

  StoreModel({this.idStore, this.nameStore, this.numRoom, this.codMeter});

  Map<String, dynamic> toMap() {
    return {
      'idStore': idStore,
      'nameStore': nameStore,
      'numRoom': numRoom,
      'codMeter': codMeter,
    };
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      idStore: map['idStore'],
      nameStore: map['nameStore'],
      numRoom: map['numRoom'],
      codMeter: map['codMeter'],
    );
  }
}

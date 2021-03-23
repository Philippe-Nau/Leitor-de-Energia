import 'package:controle_fornecedores/data/models/meterModel.dart';

abstract class MeterRepositoryinterface {
  Future<List<MeterModel>> findAllMeters();
}

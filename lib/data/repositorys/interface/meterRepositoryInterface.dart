import 'package:controle_fornecedores/data/models/meterModel.dart';

abstract class MeterRepositoryinterface {
  Future<List<MeterModel>> findAllMeters();
  Future<bool> postMeter(String _codMeter);
  Future<bool> deleteMeter(int _idMeter);
  Future<bool> alterMeter(int _idMeter, String _codMeter);
}

import 'package:get/get.dart';

class GeralController extends GetxController {
  final DateTime dateNow = DateTime.now();
  final RxString month = ''.obs;

  final roomSelected = ''.obs;
  final List<String> _rooms = ['Sala-01', 'Sala-02', 'Sala-03'];
  List<String> get rooms => _rooms;

  @override
  void onInit() {
    selectMonth();
    super.onInit();
  }

  selectMonth() {
    switch (dateNow.month) {
      case 1:
        month.value = 'Janeiro';
        break;
      case 2:
        month.value = 'Fevereiro';
        break;
      case 3:
        month.value = 'Março';
        break;
      case 4:
        month.value = 'Abril';
        break;
      case 5:
        month.value = 'Maio';
        break;
      case 6:
        month.value = 'Junho';
        break;
      case 7:
        month.value = 'Julho';
        break;
      case 8:
        month.value = 'Agosto';
        break;
      case 9:
        month.value = 'Setembro';
        break;
      case 10:
        month.value = 'Outubro';
        break;
      case 11:
        month.value = 'Novembro';
        break;
      case 12:
        month.value = 'Dezembro';
        break;
    }
  }

  selectRoom(value) {
    roomSelected.value = value;
  }
}

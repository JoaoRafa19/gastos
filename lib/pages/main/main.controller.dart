import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  final _obj = 'teste'.obs;
  set obj(value) => _obj.value = value;
  String get obj => _obj.value;
}

import 'package:get/get.dart';

import '../in_first/in_first_logic.dart';
import '../in_second/in_second_logic.dart';
import 'in_tab_logic.dart';

class InTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InTabLogic());
    Get.lazyPut(() => InFirstLogic());
    Get.lazyPut(() => InSecondLogic());
  }
}

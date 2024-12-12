import 'package:get/get.dart';

import 'in_second_logic.dart';

class InSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InSecondLogic());
  }
}

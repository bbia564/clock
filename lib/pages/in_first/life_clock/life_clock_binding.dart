import 'package:get/get.dart';

import 'life_clock_logic.dart';

class LifeClockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LifeClockLogic());
  }
}

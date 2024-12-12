import 'package:get/get.dart';

import 'commuter_clock_logic.dart';

class CommuterClockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommuterClockLogic());
  }
}

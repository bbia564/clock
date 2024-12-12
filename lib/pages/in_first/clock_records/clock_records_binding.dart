import 'package:get/get.dart';

import 'clock_records_logic.dart';

class ClockRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClockRecordsLogic());
  }
}

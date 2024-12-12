import 'package:get/get.dart';

import 'clock_menu_logic.dart';

class ClockMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}

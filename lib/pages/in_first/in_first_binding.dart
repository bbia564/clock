import 'package:get/get.dart';

import 'in_first_logic.dart';

class InFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InFirstLogic());
  }
}

import 'dart:async';

import 'package:get/get.dart';

class InFirstLogic extends GetxController {


  var hmsStr = '-'.obs;
  var mdStr = '-'.obs;
  var weekStr = '-'.obs;

  Timer? _timer;

  void startTimer() {
    final weeks = ['Sunday','Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      hmsStr.value = DateTime.now().toString().substring(11, 19);
      mdStr.value = DateTime.now().toString().substring(5, 10);
      weekStr.value = weeks[DateTime.now().weekday];
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    super.onInit();
  }

}

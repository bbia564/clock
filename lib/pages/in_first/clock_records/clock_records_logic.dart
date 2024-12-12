import 'package:clock_in/db_in/db_in.dart';
import 'package:get/get.dart';

import '../../../db_in/in_entity.dart';

class ClockRecordsLogic extends GetxController {

  DBIn dbIn = Get.find();

  var list = <InEntity>[].obs;

  void getData() async {
    list.value = await dbIn.getInAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}

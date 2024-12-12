import 'package:clock_in/db_in/db_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../db_in/in_entity.dart';

class CommuterClockLogic extends GetxController {

  DBIn dbIn = Get.find();

  int style = 0;
  DateTime? atInTime;
  String atInTimeStr = '';
  String local = '';
  String remark = '';

  void showTimeSelect(BuildContext context) {
    DatePicker.showDatePicker(context,dateFormat: 'yyyy-MM-dd HH:mm',onConfirm: (date, list) {
      atInTime = date;
      atInTimeStr = DateFormat('yyyy-MM-dd HH:mm').format(date);
      update();
    });
  }

  void commit() async {
    if (atInTime == null) {
      Fluttertoast.showToast(msg: 'Please select time');
      return;
    }
    if (local.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input local');
      return;
    }
    if (remark.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input remark');
      return;
    }
    await dbIn.insertIn(InEntity(
      id: 0,
      createdTime: DateTime.now(),
      type: 0,
      inStyle: style == 0 ? 'In' : 'Out',
      atInTime: atInTime!,
      local: local,
      remark: remark,
    ));
    Fluttertoast.showToast(msg: 'Success');
    Get.back();
  }

}

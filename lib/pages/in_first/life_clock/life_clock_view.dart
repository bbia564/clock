import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import '../commuter_clock/in_text_field.dart';
import 'life_clock_logic.dart';

class LifeClockPage extends GetView<LifeClockLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeClock'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(15),
          child: GetBuilder<LifeClockLogic>(builder: (_) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                const Text(
                  'Punch type',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: InTextField(
                      textAlign: TextAlign.center,
                      value: controller.typeStr,
                      maxLength: 20,
                      onChange: (value) {
                        controller.typeStr = value;
                      }),
                ).decorated(
                    border: Border.all(color: const Color(0xffd7d8d9)),
                    color: const Color(0xfffafafa),
                    borderRadius: BorderRadius.circular(12)),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Clocking time',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: IgnorePointer(
                    child: InTextField(
                        hintText: 'Please select time',
                        textAlign: TextAlign.center,
                        value: controller.atInTimeStr,
                        onChange: (value) {}),
                  ),
                )
                    .decorated(
                        border: Border.all(color: const Color(0xffd7d8d9)),
                        color: const Color(0xfffafafa),
                        borderRadius: BorderRadius.circular(12))
                    .gestures(onTap: () {
                  controller.showTimeSelect(context);
                }),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Remark',
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: InTextField(
                      textAlign: TextAlign.center,
                      value: controller.remark,
                      maxLength: 20,
                      onChange: (value) {
                        controller.remark = value;
                      }),
                ).decorated(
                    border: Border.all(color: const Color(0xffd7d8d9)),
                    color: const Color(0xfffafafa),
                    borderRadius: BorderRadius.circular(12)),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    'Commit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
                    .decorated(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12))
                    .gestures(onTap: () {
                  controller.commit();
                })
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            );
          }),
        )
            .decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12))
            .marginAll(15),
      ),
    );
  }
}

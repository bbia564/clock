import 'package:clock_in/main.dart';
import 'package:clock_in/pages/in_first/commuter_clock/in_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'commuter_clock_logic.dart';

class CommuterClockPage extends GetView<CommuterClockLogic> {
  Widget _typeStyleItem(int index) {
    final titles = ['Clock in', 'Clock out'];
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      child: Text(
        titles[index],
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: controller.style == index ? Colors.white : Colors.black),
      ),
    )
        .decorated(
            border: controller.style == index
                ? null
                : Border.all(color: const Color(0xffd7d8d9)),
            color: controller.style == index
                ? primaryColor
                : const Color(0xfffafafa),
            borderRadius: BorderRadius.circular(8))
        .gestures(onTap: () {
      controller.style = index;
      controller.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CommuterClock'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(15),
          child: GetBuilder<CommuterClockLogic>(builder: (_) {
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
                <Widget>[
                  _typeStyleItem(0),
                  const SizedBox(
                    width: 10,
                  ),
                  _typeStyleItem(1)
                ].toRow(),
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
                ).decorated(
                    border: Border.all(color: const Color(0xffd7d8d9)),
                    color: const Color(0xfffafafa),
                    borderRadius: BorderRadius.circular(12)).gestures(onTap: (){
                      controller.showTimeSelect(context);
                }),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Clocking local',
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
                      value: controller.local,
                      maxLength: 20,
                      onChange: (value) {
                        controller.local = value;
                      }),
                ).decorated(
                    border: Border.all(color: const Color(0xffd7d8d9)),
                    color: const Color(0xfffafafa),
                    borderRadius: BorderRadius.circular(12)),
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
                ).decorated(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12)).gestures(onTap: (){
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

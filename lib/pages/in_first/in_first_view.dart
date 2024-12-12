import 'package:clock_in/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'in_first_logic.dart';

class InFirstPage extends GetView<InFirstLogic> {
  Widget _item(int index) {
    final titles = ['Commute clock','Life clock', 'Clock records'];
    final subTitles = ['Record the work','Record the routine of life', 'Check the clock record'];
    return Container(
      width: double.infinity,
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: <Widget>[
        Image.asset(
          'assets/item$index.webp',
          width: 37,
          height: 37,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: <Widget>[
          Text(
            titles[index],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            subTitles[index],
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          )
        ].toColumn(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start)),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 25,
          color: Colors.grey,
        )
      ].toRow(),
    )
        .decorated(color: Colors.white, borderRadius: BorderRadius.circular(15))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      switch (index) {
        case 0:
          Get.toNamed('/commuter_clock');
          break;
        case 1:
          Get.toNamed('/life_clock');
          break;
        case 2:
          Get.toNamed('/clock_records');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: <Widget>[
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
        ),
        <Widget>[
          Image.asset(
            'assets/bg.webp',
            width: double.infinity,
            height: 244,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 244,
            child: <Widget>[
              Obx(() {
                return Text(
                  controller.hmsStr.value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                );
              }),
              <Widget>[
                Obx(() {
                  return Text(
                    controller.mdStr.value,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  );
                }),
                const SizedBox(
                  width: 10,
                ),
                Obx(() {
                  return Text(
                    controller.weekStr.value,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  );
                })
              ].toRow(crossAxisAlignment: CrossAxisAlignment.start)
            ]
                .toColumn(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start)
                .marginSymmetric(horizontal: 15),
          )
        ].toStack(alignment: Alignment.centerLeft),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[_item(0), _item(1), _item(2)].toColumn(),
          ).marginAll(20)),
        )
            .decorated(
                color: bgColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)))
            .marginOnly(top: 220)
      ].toStack(alignment: Alignment.topCenter),
    );
  }
}

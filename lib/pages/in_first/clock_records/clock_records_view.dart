import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'clock_records_logic.dart';

class ClockRecordsPage extends GetView<ClockRecordsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock records'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: Obx(() {
        return controller.list.value.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: <Widget>[
                      Text(
                        entity.atInTimeStr,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          '${entity.type == 0 ? 'Commuter clock' : 'Life clock'} - ${entity.inStyle}')
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12))
                      .marginOnly(bottom: 10);
                });
      })),
    );
  }
}

import 'package:clock_in/pages/in_first/in_first_view.dart';
import 'package:clock_in/pages/in_second/in_second_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'in_tab_logic.dart';

class InTabPage extends GetView<InTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          InFirstPage(),
          InSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navInBars()),
    );
  }

  Widget _navInBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.home_filled,color: primaryColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.settings,color: primaryColor),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}

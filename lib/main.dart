import 'package:clock_in/db_in/db_in.dart';
import 'package:clock_in/pages/in_first/clock_menu/clock_menu_binding.dart';
import 'package:clock_in/pages/in_first/clock_menu/clock_menu_view.dart';
import 'package:clock_in/pages/in_first/clock_records/clock_records_binding.dart';
import 'package:clock_in/pages/in_first/clock_records/clock_records_main.dart';
import 'package:clock_in/pages/in_first/clock_records/clock_records_view.dart';
import 'package:clock_in/pages/in_first/commuter_clock/commuter_clock_binding.dart';
import 'package:clock_in/pages/in_first/commuter_clock/commuter_clock_view.dart';
import 'package:clock_in/pages/in_first/in_first_binding.dart';
import 'package:clock_in/pages/in_first/in_first_view.dart';
import 'package:clock_in/pages/in_first/life_clock/life_clock_binding.dart';
import 'package:clock_in/pages/in_first/life_clock/life_clock_view.dart';
import 'package:clock_in/pages/in_second/in_second_binding.dart';
import 'package:clock_in/pages/in_second/in_second_view.dart';
import 'package:clock_in/pages/in_tab/in_tab_binding.dart';
import 'package:clock_in/pages/in_tab/in_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xff58a5fe);
Color bgColor = const Color(0xffecf9ff);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => DBIn().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Clocks,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Clocks = [
  GetPage(name: '/', page: () => const ClockMenuView(), binding: ClockMenuBinding()),
  GetPage(name: '/in_tab', page: () => InTabPage(), binding: InTabBinding()),
  GetPage(name: '/in_first', page: () => InFirstPage(), binding: InFirstBinding()),
  GetPage(name: '/in_second', page: () => InSecondPage(), binding: InSecondBinding()),
  GetPage(name: '/in_main', page: () => const ClockRecordsMain()),
  GetPage(name: '/life_clock', page: () => LifeClockPage(), binding: LifeClockBinding()),
  GetPage(name: '/commuter_clock', page: () => CommuterClockPage(), binding: CommuterClockBinding()),
  GetPage(name: '/clock_records', page: () => ClockRecordsPage(), binding: ClockRecordsBinding()),
];
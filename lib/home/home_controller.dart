import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_bottom_menu/data/db_hive.dart';

import '../page/page_1.dart';
import '../page/page_2.dart';
import '../page/page_3.dart';

class HomeController extends GetxController {
  final DBHive _dbHive = DBHive();
  var tabIndex = 0.obs;
  var tabTextTitle = ''.obs;

  @override
  void onInit() async {
    tabTextTitle.value = await _tabTitle(tabIndex.value);
    getDeviceLanguage();
    super.onInit();
  }

  final List<Widget> pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  Future<String> _tabTitle(int tabIndex) async {
    await Future.delayed(const Duration(milliseconds: 250));
    switch (tabIndex) {
      case 0:
        return 'home'.tr;
      case 1:
        return 'search'.tr;
      case 2:
        return 'profile'.tr;
      default:
        return '';
    }
  }

  void diveceLanguage() async {
    var locale = const Locale('en', 'US');
    var divace = Get.deviceLocale!;
    if (Get.locale == divace) {
      Get.updateLocale(locale);
      _dbHive.setLanguage(locale.toString());
    } else {
      Get.updateLocale(divace);
      _dbHive.setLanguage(divace.toString());
    }
    //Get.updateLocale(Get.locale == divace ? locale : divace);
    tabTextTitle.value = await _tabTitle(tabIndex.value);
  }

  void getDeviceLanguage() async {
    _dbHive.getLanguage().then((value) async {
      if (value.isNotEmpty) {
        Get.updateLocale(Locale(value));
      } else {
        Get.updateLocale(Get.deviceLocale!);
      }
      tabTextTitle.value = await _tabTitle(tabIndex.value);
    });
  }

  void changeTabIndex(int index) async {
    tabIndex.value = index;

    tabTextTitle.value = await _tabTitle(index);
  }
}

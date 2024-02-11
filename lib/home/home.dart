// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_element, deprecated_member_use, unnecessary_new

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bottom_menu/static/static_params.dart';
import 'home_controller.dart';
import 'my_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Scaffold(
        body: Obx(() => homeController.pages[homeController.tabIndex.value]),
        appBar: MyAppBar(homeController: homeController),
        bottomNavigationBar: Obx(
          () => Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: myAppBar, width: 3), // Çizginin rengi ve kalınlığı
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: myZemin,
              unselectedItemColor: Colors.blue,
              selectedItemColor: myAppBar,
              currentIndex: homeController.tabIndex.value,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              onTap: homeController.changeTabIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'.tr),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'.tr),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _willPopScope() {
    if (homeController.tabIndex.value != 0) {
      homeController.changeTabIndex(0);
    } else {
      Get.defaultDialog();
    }
    return Future.value(false);
  }

  FloatingActionButton _floatingButon() {
    return FloatingActionButton(
      onPressed: () => homeController.changeTabIndex(1),
      child: Icon(
        Icons.reply_sharp,
        size: 35,
      ),
      shape: StadiumBorder(),
      backgroundColor: myAppBar,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_bottom_menu/home/home_controller.dart';
import 'package:getx_bottom_menu/static/static_params.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
        child: Text(
              _homeController.tabTextTitle.value,
              style: textStyle,
            )));
  }
}

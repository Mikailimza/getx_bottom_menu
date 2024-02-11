import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../static/static_params.dart';
import '../home/home_controller.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../static/static_params.dart';
import '../home/home_controller.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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

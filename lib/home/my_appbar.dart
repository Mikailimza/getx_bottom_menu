import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../static/static_params.dart';
import 'home_controller.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController homeController;
  const MyAppBar({key, required this.homeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        centerTitle: true,
        title: Text(
          homeController.tabTextTitle.value,
          style: textStyle,
        ),
        backgroundColor: myZemin,
        //elevation: 1,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3.0), // Burada border'ın yüksekliğini belirliyorsunuz.
          child: Container(
            height: 3.0,
            color: myAppBar, // Burada border'ın rengini belirliyorsunuz.
          ),
        ),
        leading: IconButton(
          onPressed: () {
            homeController.diveceLanguage();
          },
          icon: const Icon(
            Icons.language,
            color: myAppBar,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // AppBar için önerilen yüksekliği belirleyin.
}

import 'package:get/get.dart';
import 'package:getx_bottom_menu/home/home.dart';

mixin getRouter {
  static List<GetPage<dynamic>>? page = [
    GetPage(name: '/', page: () => const HomePage()),
  ];
}

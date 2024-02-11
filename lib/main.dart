import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_bottom_menu/static/router.dart';
import 'package:getx_bottom_menu/static/static_params.dart';
import 'package:getx_bottom_menu/static/translations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemStatusBarContrastEnforced: true,
    statusBarColor: myAppBar,
    systemNavigationBarColor: myAppBar,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  await Hive.initFlutter();
  await Hive.openBox('language');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: getRouter.page,
      translations: Language(),
      locale: const Locale('tr', 'TR'),
      fallbackLocale: const Locale('en', 'US'),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: myZemin,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              systemStatusBarContrastEnforced: true,
              statusBarColor: myAppBar,
              statusBarBrightness: Brightness.dark,
              systemNavigationBarContrastEnforced: true,
              systemNavigationBarDividerColor: myAppBar,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: myAppBar),
        ),
      ),
    );
  }
}

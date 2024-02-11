import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

class DBHive {
  final _language = Hive.box('language');

  Future<String> setLanguage(String locale) async {
    await _language.put('language', locale);

    final loca = await _language.get('language');

    return loca;
  }

  Future<String> getLanguage() async {
    final local = await _language.get('language', defaultValue: 'tr_TR');
    log("Locale Langue : $local");
    return local;
  }
}

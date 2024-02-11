import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'home': 'Home',
          'profile': 'Profile',
          'search': 'Search',
        },
        'tr_TR': {
          'home': 'Ana Sayfa',
          'profile': 'Profil',
          'search': 'Ara',
        },
      };
}

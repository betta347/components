import 'package:components/constants/country_phone_codes.dart';

mixin MyFireFunctions {
  static String makeWeekName(int weekday) {
    switch (weekday) {
      case 0:
        return 'Mn';
      case 1:
        return 'Tu';
      case 2:
        return 'Wd';
      case 3:
        return 'Th';
      case 4:
        return 'Fr';
      case 5:
        return 'St';
      case 6:
        return 'Sn';
      default:
        return 'Xd';
    }
  }

  static List<Map<String, dynamic>> getCountryCodes() => countryPhoneCodes;
}

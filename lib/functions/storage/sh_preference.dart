import 'package:shared_preferences/shared_preferences.dart';

class MyStorageRepository {
  static MyStorageRepository? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<MyStorageRepository> getInstance() async {
    if (_storageUtil == null) {
      final secureStorage = MyStorageRepository._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }

  MyStorageRepository._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool>? putString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences!.setString(key, value);
  }

  static Future<bool>? putList(String key, List<String> value) {
    if (_preferences == null) return null;
    return _preferences!.setStringList(key, value);
  }

  static String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;

    return _preferences!.getString(key) ?? defValue;
  }

  static Future<bool>? deleteString(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  static double getDouble(String key, {double defValue = 0.0}) {
    if (_preferences == null) return defValue;
    return _preferences!.getDouble(key) ?? defValue;
  }

  static List<String> getList(String key, {List<String> defValue = const []}) {
    if (_preferences == null) return List.empty(growable: true);
    return _preferences!.getStringList(key) ?? List.empty(growable: true);
  }

  static Future<bool>? putDouble(String key, double value) {
    if (_preferences == null) return null;
    return _preferences!.setDouble(key, value);
  }

  static Future<bool>? deleteDouble(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  static bool getBool(String key, {bool defValue = true}) {
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }

  static Future<bool>? putBool(String key, bool value) {
    if (_preferences == null) return null;
    return _preferences!.setBool(key, value);
  }

  static Future<bool>? deleteBool(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }
}

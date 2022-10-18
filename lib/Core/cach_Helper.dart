import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? pref;

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await pref!.setBool(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    //if (pref != null) pref!.get(key);

    return pref!.containsKey(key) ? pref!.get(key) : null;
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await pref!.setString(key, value);
    if (value is int) return await pref!.setInt(key, value);
    if (value is bool) return await pref!.setBool(key, value);
    return await pref!.setDouble(key, value);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await pref!.remove(key);
  }
}

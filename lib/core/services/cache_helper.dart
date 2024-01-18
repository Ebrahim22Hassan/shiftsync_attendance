import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  Future<bool> putBoolean({required String key, required bool value});

  dynamic getData({required String? key});

  Future<bool> saveData({required String key, required dynamic value});

  Future<bool> removeData({required String key});

  Future<bool> containsKey(key);
}

class CacheHelperImpl implements CacheHelper {
  final SharedPreferences? sharedPreferences;

  CacheHelperImpl({this.sharedPreferences});

  // static init() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }

  @override
  Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }

  @override
  getData({required String? key}) => sharedPreferences?.get(key!);

  @override
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }

  @override
  Future<bool> saveData({required String key, required value}) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    return await sharedPreferences!.setDouble(key, value);
  }

  @override
  Future<bool> containsKey(key) async {
    return sharedPreferences!.containsKey(key);
  }
}
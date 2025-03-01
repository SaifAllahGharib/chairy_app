import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  MySharedPreferences._internal();

  static final MySharedPreferences _instance = MySharedPreferences._internal();

  factory MySharedPreferences() => _instance;

  final Logger _logger = Logger();
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> storeUser(Map<String, dynamic> user) async {
    for (var entry in user.entries) {
      await storeString(entry.key, entry.value.toString());
    }
  }

  String? getUserToken() => getString('token');

  String? getIdUser() => getString('uid');

  String? getNameUser() => getString('name');

  String? getEmailUser() => getString('email');

  String? getPhoneUser() => getString('phone');

  String? getRoleUser() => getString('role');

  bool userIsLogin() =>
      getUserToken() != null &&
      getUserToken()!.isNotEmpty &&
      getUserToken() != "null";

  Future<bool> storeString(String key, String value) async {
    return await _safeWrite(
        () => _prefs.setString(key, value), 'Error storing string');
  }

  Future<bool> storeInt(String key, int value) async {
    return await _safeWrite(
        () => _prefs.setInt(key, value), 'Error storing int');
  }

  Future<bool> storeDouble(String key, double value) async {
    return await _safeWrite(
        () => _prefs.setDouble(key, value), 'Error storing double');
  }

  Future<bool> storeBool(String key, bool value) async {
    return await _safeWrite(
        () => _prefs.setBool(key, value), 'Error storing bool');
  }

  Future<bool> removeKey(String key) async {
    return await _safeWrite(
        () => _prefs.remove(key), 'Error removing key: $key');
  }

  Future<void> removeKeysContaining(String keyword) async {
    try {
      final keys = _prefs.getKeys();
      for (String key in keys) {
        if (key.contains(keyword)) {
          await _prefs.remove(key);
        }
      }
    } catch (e, stacktrace) {
      _logger.e(
        'Error removing keys containing: $keyword',
        error: e,
        stackTrace: stacktrace,
      );
    }
  }

  String? getString(String key) => _prefs.getString(key);

  int? getInt(String key) => _prefs.getInt(key);

  double? getDouble(String key) => _prefs.getDouble(key);

  bool? getBool(String key) => _prefs.getBool(key);

  Future<bool> clearAllData() async {
    return await _safeWrite(() => _prefs.clear(), 'Error clearing data');
  }

  Future<bool> _safeWrite(
      Future<bool> Function() operation, String errorMessage) async {
    try {
      return await operation();
    } catch (e, stacktrace) {
      _logger.e(errorMessage, error: e, stackTrace: stacktrace);
      return false;
    }
  }
}

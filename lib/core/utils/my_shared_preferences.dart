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

  String? getIdUser() => getString('uid');

  String? getNameUser() => getString('name');

  String? getEmailUser() => getString('email');

  String? getPhoneUser() => getString('phone');

  String? getRoleUser() => getString('role');

  Future<bool> storeString(String key, String value) async {
    return await _safeWrite(
        () => _prefs.setString(key, value), 'Error storing string');
  }

  String? getString(String key) => _prefs.getString(key);

  Future<bool> clearAllData() async {
    return await _safeWrite(() => _prefs.clear(), 'Error clearing data');
  }

  // String getInitRoute() {
  //   final lang = getString('lang');
  //   final id = getIdUser();
  //   if (lang == null) return '/';
  //   return id == null ? LoginView.id : HomeView.id;
  // }

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

import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final MySharedPreferences _sharedPreferences;

  ThemeCubit(this._sharedPreferences) : super(ThemeMode.light) {
    loadSavedTheme();
  }

  Future<void> loadSavedTheme() async {
    final savedTheme = _sharedPreferences.getString("theme") ?? "light";
    emit(savedTheme == "dark" ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> changeTheme(ThemeMode mode) async {
    final themeString = mode == ThemeMode.dark ? "dark" : "light";
    await _sharedPreferences.storeString("theme", themeString);
    emit(mode);
  }
}

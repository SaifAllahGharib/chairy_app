import 'package:chairy_app/core/utils/my_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalCubit extends Cubit<Locale> {
  final MySharedPreferences _sharedPreferences;

  LocalCubit(this._sharedPreferences) : super(const Locale("en")) {
    loadSavedLanguage();
  }

  Future<void> loadSavedLanguage() async {
    final savedLanguage = _sharedPreferences.getString("lang") ?? "en";
    if (savedLanguage != state.languageCode) {
      emit(Locale(savedLanguage));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    if (languageCode != state.languageCode) {
      await _sharedPreferences.storeString("lang", languageCode);
      emit(Locale(languageCode));
    }
  }

  bool get isArabic => state.languageCode == "ar";
}

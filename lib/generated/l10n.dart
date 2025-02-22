// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Make your interior more minimalistic & modern`
  String get makeModern {
    return Intl.message(
      'Make your interior more minimalistic & modern',
      name: 'makeModern',
      desc: '',
      args: [],
    );
  }

  /// `Turn your room with panto into a lot more minimalist and modern with ease and speed`
  String get turnYourRoom {
    return Intl.message(
      'Turn your room with panto into a lot more minimalist and modern with ease and speed',
      name: 'turnYourRoom',
      desc: '',
      args: [],
    );
  }

  /// `Our\nCategories`
  String get ourCategories {
    return Intl.message(
      'Our\\nCategories',
      name: 'ourCategories',
      desc: '',
      args: [],
    );
  }

  /// `More Info`
  String get moreInfo {
    return Intl.message('More Info', name: 'moreInfo', desc: '', args: []);
  }

  /// `Living Room`
  String get livingRoom {
    return Intl.message('Living Room', name: 'livingRoom', desc: '', args: []);
  }

  /// `Chic Furnishings Online Furniture Store`
  String get chicStore {
    return Intl.message(
      'Chic Furnishings Online Furniture Store',
      name: 'chicStore',
      desc: '',
      args: [],
    );
  }

  /// `Discover Elegant Comfort for Every Room`
  String get discoverRoom {
    return Intl.message(
      'Discover Elegant Comfort for Every Room',
      name: 'discoverRoom',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Ar`
  String get ar {
    return Intl.message('Ar', name: 'ar', desc: '', args: []);
  }

  /// `En`
  String get en {
    return Intl.message('En', name: 'en', desc: '', args: []);
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message('Add To Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Your Cart`
  String get yourCart {
    return Intl.message('Your Cart', name: 'yourCart', desc: '', args: []);
  }

  /// `Review Your Items`
  String get reviewYourItems {
    return Intl.message(
      'Review Your Items',
      name: 'reviewYourItems',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

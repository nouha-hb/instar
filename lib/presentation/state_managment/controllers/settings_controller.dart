import 'package:flutter/material.dart';
import 'package:instar/core/l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/string_const.dart';

class SettingsController extends ChangeNotifier {
  Locale? _locale;
  int language = 0;

  Locale? get locale => _locale;

  void setLocale(Locale locale, int lang) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    language = lang;
    notifyListeners();
  }

  void clearLocale() {
    _locale = Locale('fr');
    notifyListeners();
  }

  void saveLanguage(int lang) async {
    final sp = await SharedPreferences.getInstance();
    sp.setInt(StringConst.SP_LANGUAGE_KEY, language);
    print('saved');
  }

  void loadLanguage() async {
    final sp = await SharedPreferences.getInstance();
    final lang = sp.getInt(StringConst.SP_LANGUAGE_KEY) ?? 0;
    language = lang;
    notifyListeners();
    _locale = L10n.all[lang];
  }
}

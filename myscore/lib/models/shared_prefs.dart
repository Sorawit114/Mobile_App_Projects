import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String _languageKey = "selectedLanguage";

  static Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language);
  }

  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? "ภาษาไทย";
  }
}

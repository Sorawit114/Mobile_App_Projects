import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String _languageKey = "selectedLanguage";

  // บันทึกค่าภาษา
  static Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language);
  }

  // ดึงค่าภาษาที่เลือกไว้ ถ้าไม่มีให้คืนค่า "ภาษาไทย" เป็นค่าเริ่มต้น
  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? "ภาษาไทย";
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = "ภาษาไทย";

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString("selectedLanguage") ?? "ภาษาไทย";
    });
  }

  Future<void> _selectLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("selectedLanguage", language);
    setState(() {
      selectedLanguage = language;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ภาษา / Language'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text(
              "ภาษาไทย",
              style: TextStyle(
                fontSize: 17.0,
                color:
                    selectedLanguage == "ภาษาไทย" ? Colors.blue : Colors.black,
              ),
            ),
            trailing: selectedLanguage == "ภาษาไทย"
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () => _selectLanguage("ภาษาไทย"),
          ),
          const Divider(),
          ListTile(
            title: Text(
              "English",
              style: TextStyle(
                fontSize: 17.0,
                color:
                    selectedLanguage == "English" ? Colors.blue : Colors.black,
              ),
            ),
            trailing: selectedLanguage == "English"
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () => _selectLanguage("English"),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

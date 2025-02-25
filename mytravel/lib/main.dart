import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../onboardingScreen.dart';
import '../screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool("ON_BOARDING") ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.lexendTextTheme()),
      title: 'My Travel 1.0',
      home: show ? OnboardingScreen() : HomeScreen(),
    );
  }
}

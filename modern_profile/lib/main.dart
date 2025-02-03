import 'package:flutter/material.dart';
import 'screen/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Profile 2024',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF9C27B0),
        hintColor: Color(0xFF7B1FA2),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF9C27B0),
        ),
      ),
      home: ProfileScreen(),
    );
  }
}

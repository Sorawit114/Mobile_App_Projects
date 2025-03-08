import 'package:flutter/material.dart';
import '../screen/home_screen.dart';

void main() {
  runApp(BKKRailApp());
}

class BKKRailApp extends StatelessWidget {
  const BKKRailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BKK Rail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';

class ParkingScreen extends StatelessWidget {
  const ParkingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ลานจอดรถ'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: const Text('ลานจอดรถ!'),
      ),
    );
  }
}

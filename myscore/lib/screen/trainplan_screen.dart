import 'package:flutter/material.dart';

class TrainPlanScreen extends StatelessWidget {
  const TrainPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('แผนงานรถไฟฟ้า'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: const Text('แผนงานรถไฟฟ้า!'),
      ),
    );
  }
}

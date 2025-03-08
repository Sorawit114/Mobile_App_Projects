import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('แสดงความคิดเห็น'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: const Text('แสดงความคิดเห็น!'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _feedbackController = TextEditingController();
  String _selectedTopic = 'การใช้งานแอปพลิเคชัน'; // ค่าเริ่มต้นของ Dropdown

  void _submitFeedback() {
    if (_feedbackController.text.trim().isEmpty) {
      _showDialog(
        title: "ข้อผิดพลาด",
        message: "กรุณาพิมพ์ความคิดเห็นของคุณ",
        isError: true,
      );
    } else {
      _showDialog(
        title: "แสดงความคิดเห็น",
        message: "ระบบได้รับข้อความของคุณแล้วครับ",
        isError: false,
      );
      _feedbackController.clear();
    }
  }

  void _showDialog(
      {required String title, required String message, required bool isError}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(color: isError ? Colors.red : Colors.black),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("ตกลง"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('แสดงความคิดเห็น'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'หัวข้อ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedTopic,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              items: const [
                DropdownMenuItem(
                    value: 'การใช้งานแอปพลิเคชัน',
                    child: Text('การใช้งานแอปพลิเคชัน')),
                DropdownMenuItem(
                    value: 'ผู้ให้บริการรถไฟ', child: Text('ผู้ให้บริการรถไฟ')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedTopic = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'ข้อความ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'กรุณาพิมพ์ความคิดเห็นของคุณ',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  side: const BorderSide(color: Colors.blue),
                ),
                child: const Text('เลือกภาพ',
                    style: TextStyle(color: Colors.blue)),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitFeedback,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'ส่งความคิดเห็น',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

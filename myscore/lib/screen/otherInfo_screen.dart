import 'package:flutter/material.dart';
import '../screen/aboutbkk_screen.dart';
import '../screen/trainplan_screen.dart';
import '../screen/feedback_screen.dart';
import '../screen/language_screen.dart';
import '../screen/map_screen.dart';
import '../screen/parking_screen.dart';

class OtherInfoScreen extends StatefulWidget {
  const OtherInfoScreen({super.key});

  @override
  _OtherInfoScreenState createState() => _OtherInfoScreenState();
}

class _OtherInfoScreenState extends State<OtherInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: const Text(
            'ข้อมูลอื่นๆ',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Row(
              children: [
                Image.network(
                  'assets/app_logo.png',
                  width: 80,
                ),
                const SizedBox(height: 10),
                const Text(
                  'BKK Rail',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          Expanded(
            child: ListView(
              children: const [
                SectionTitle(title: 'รายละเอียดอื่นๆ'),
                MenuItem(
                    icon: Icons.info,
                    text: 'เกี่ยวกับ BKK Rail',
                    nextScreen: AboutBkkRailScreen()),
                MenuItem(
                    icon: Icons.map,
                    text: 'แผนงานรถไฟฟ้า',
                    nextScreen: TrainPlanScreen()),
                MenuItem(
                    icon: Icons.directions_transit,
                    text: 'แผนที่ระบบขนส่งมวลชนทางราง',
                    nextScreen: MapScreen()),
                MenuItem(
                    icon: Icons.local_parking,
                    text: 'ลานจอดรถ',
                    nextScreen: ParkingScreen()),
                MenuItem(
                    icon: Icons.comment,
                    text: 'แสดงความคิดเห็น',
                    nextScreen: FeedbackScreen()),
                Divider(),
                SectionTitle(title: 'ตั้งค่าระบบ'),
                MenuItem(
                    icon: Icons.language,
                    text: 'ภาษา / Language',
                    nextScreen: LanguageScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget nextScreen;

  const MenuItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => nextScreen,
          ),
        );
      },
    );
  }
}

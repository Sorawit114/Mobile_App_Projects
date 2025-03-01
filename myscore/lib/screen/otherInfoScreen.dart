import 'package:flutter/material.dart';

class OtherInfoScreen extends StatefulWidget {
  @override
  _OtherInfoScreenState createState() => _OtherInfoScreenState();
}

class _OtherInfoScreenState extends State<OtherInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'ข้อมูลอื่นๆ',
          ),
        ),
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
                MenuItem(icon: Icons.info, text: 'เกี่ยวกับ BKK Rail'),
                MenuItem(icon: Icons.map, text: 'แผนงานรถไฟฟ้า'),
                MenuItem(
                    icon: Icons.directions_transit,
                    text: 'แผนที่ระบบขนส่งมวลชนทางราง'),
                MenuItem(icon: Icons.local_parking, text: 'ลานจอดรถ'),
                MenuItem(icon: Icons.comment, text: 'แสดงความคิดเห็น'),
                Divider(),
                SectionTitle(title: 'ตั้งค่าระบบ'),
                MenuItem(icon: Icons.language, text: 'ภาษา / Language'),
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
  const MenuItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // ใส่โค้ด navigation ไปยังหน้าที่เกี่ยวข้อง
      },
    );
  }
}

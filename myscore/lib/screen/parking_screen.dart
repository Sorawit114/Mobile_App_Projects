import 'package:flutter/material.dart';

class ParkingScreen extends StatelessWidget {
  const ParkingScreen({super.key});

  final List<Map<String, String>> parkingData = const [
    {"available": "99+", "station": "BL15 สถานีลาดพร้าว อาคารจอดรถ 9 ชั้น"},
    {"available": "77", "station": "BL16 สถานีรัชดาภิเษก"},
    {"available": "N/A", "station": "BL18 สถานีห้วยขวาง"},
    {"available": "99+", "station": "BL19 สถานีศูนย์วัฒนธรรมแห่งประเทศไทย"},
    {"available": "30", "station": "BL19 สถานีศูนย์วัฒนธรรมฯ (ลาน 1)"},
    {
      "available": "99+",
      "station": "BL20 สถานีพระราม 9 ลานจอดรถ รัชดาภิเษก ซอย 2"
    },
    {"available": "54", "station": "BL21 สถานีเพชรบุรี"},
    {"available": "11", "station": "BL22 สถานีสุขุมวิท"},
    {"available": "85", "station": "BL23 สถานีศูนย์การประชุมแห่งชาติสิริกิติ์"},
  ];

  Color _getAvailabilityColor(String available) {
    if (available == "N/A") {
      return Colors.amber;
    } else if (available == "99+" ||
        int.tryParse(available) != null && int.parse(available) > 50) {
      return Colors.teal;
    } else {
      return Colors.teal[300]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ลานจอดรถ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: parkingData.length,
        itemBuilder: (context, index) {
          final data = parkingData[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _getAvailabilityColor(data["available"]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "ที่ว่าง\n${data["available"]}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      data["station"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

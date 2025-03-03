import 'package:flutter/material.dart';
import 'package:myscore/models/stationConnections.dart';
import '../Widget/color.dart';

class StationDetailScreen extends StatelessWidget {
  final String stationName;
  final String lineColor;
  final List<String> routeStations;

  StationDetailScreen({
    required this.stationName,
    required this.lineColor,
    required this.routeStations,
  });

  @override
  Widget build(BuildContext context) {
    Color mainColor = ColorUtils.getColorByLine(lineColor);
    List<String>? connections = stationConnections[stationName];

    return Scaffold(
      appBar: AppBar(
        title: Text(stationName),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (connections != null && connections.isNotEmpty) ...[
              Text(
                'จุดเชื่อมต่อ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Column(
                children: connections.map((line) {
                  return ListTile(
                    leading: Icon(Icons.compare_arrows, color: Colors.blue),
                    title: Text(line),
                  );
                }).toList(),
              ),
              Divider(height: 30, thickness: 2),
            ],
            Text(
              'สิ่งอำนวยความสะดวก',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFacility(Icons.elevator, 'ลิฟต์'),
                _buildFacility(Icons.accessible, 'ทางลาด'),
                _buildFacility(Icons.directions_bus, 'รถโดยสาร'),
                _buildFacility(Icons.local_parking, 'ที่จอดรถ'),
              ],
            ),
            Divider(height: 30, thickness: 2),
            Text(
              'ข้อมูลทางออก',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildExitInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildFacility(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildExitInfo() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.red),
          title: Text('Exit 1 - ไปห้างสรรพสินค้า'),
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app, color: Colors.red),
          title: Text('Exit 2 - ไปโรงพยาบาล'),
        ),
      ],
    );
  }
}

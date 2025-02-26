import 'package:flutter/material.dart';
import '../screen/station_selection_screen.dart';
import '../models/station_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? fromStation;
  String? toStation;
  double fare = 0.0;

  void updateStations(String selectedStation) {
    setState(() {
      if (fromStation == null) {
        fromStation = selectedStation;
        fare = 0.0;
      } else {
        toStation = selectedStation;
        if (fromStation != null && toStation != null) {
          fare = calculateFare(fromStation!, toStation!);
        }
      }
    });
  }

  double calculateFare(String from, String to) {
    int fromIndex = stations.keys.toList().indexOf(from);
    int toIndex = stations.keys.toList().indexOf(to);
    int stationDistance = (toIndex - fromIndex).abs();
    return 15.0 + stationDistance - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BKK Rail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('สถานีต้นทาง: ${fromStation ?? 'ยังไม่ได้เลือก'}'),
            Text('สถานีปลายทาง: ${toStation ?? 'ยังไม่ได้เลือก'}'),
            SizedBox(height: 20),
            Text('ราคา: ${fare.toStringAsFixed(2)} บาท'),
            SizedBox(height: 20),
            Image.asset('assets/test.jpg', width: 300),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final selectedStation = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StationSelectionScreen()),
                );
                if (selectedStation != null) {
                  updateStations(selectedStation);
                }
              },
              child: Text(
                'เลือกสถานีต้นทาง',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                final selectedStation = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StationSelectionScreen()),
                );
                if (selectedStation != null) {
                  updateStations(selectedStation);
                }
              },
              child: Text(
                'เลือกสถานีปลายทาง',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

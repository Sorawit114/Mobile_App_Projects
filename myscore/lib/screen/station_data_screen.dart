import 'package:flutter/material.dart';
import 'package:myscore/models/stationConnections.dart';
import 'package:myscore/screen/station_detail_screen.dart';
import '../Widget/color.dart';
import '../models/station_data.dart';

class StationDataScreen extends StatefulWidget {
  const StationDataScreen({super.key});

  @override
  _StationDataScreenState createState() => _StationDataScreenState();
}

class _StationDataScreenState extends State<StationDataScreen> {
  String? filterColor;
  String searchQuery = '';
  List<String> filteredStations = stations.keys.toList();

  @override
  void initState() {
    super.initState();
    filterColor = stations.values.first;
    filterStations(filterColor!);
  }

  void filterStations(String color) {
    setState(() {
      filterColor = color;
      filteredStations = stations.entries
          .where((entry) => entry.value == color)
          .map((entry) => entry.key)
          .toList();
    });
  }

  void searchStations(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      if (searchQuery.isEmpty) {
        filteredStations = stations.entries
            .where((entry) => entry.value == filterColor)
            .map((entry) => entry.key)
            .toList();
      } else {
        filteredStations = stations.keys.where((station) {
          return station.toLowerCase().contains(searchQuery);
        }).toList();
      }
    });
  }

  final Map<String, String> lineNames = {
    'สายสีเขียว': 'BTS',
    'สายสีเขียวเข้ม': 'BTS',
    'สายสีน้ำเงิน': 'MRT',
    'สายสีม่วง': 'MRT',
    'สายสีส้ม': 'ARL',
    'สายสีทอง': 'BTS-G',
    'สายสีแดง': 'SRTET',
    'สายสีแดงอ่อน': 'SRTET',
    'สายสีเหลือง': 'Yellow\nLine',
    'สายสีชมพู': 'Pink\nLine',
  };

  Map<String, String> Nameline = {
    'สายสีเขียว': 'สายสีเขียวสุขุมวิท',
    'สายสีเขียวเข้ม': 'สายสีเขียวสีลม',
    'สายสีน้ำเงิน': 'สายสีน้ำเงิน',
    'สายสีม่วง': 'สายสีม่วง',
    'สายสีส้ม': 'แอร์พอร์ต เรล ลิงก์',
    'สายสีทอง': 'สายสีทอง',
    'สายสีแดง': 'สายสีแดงเข้ม',
    'สายสีแดงอ่อน': 'สายสีแดงอ่อน',
    'สายสีเหลือง': 'สายสีเหลือง',
    'สายสีชมพู': 'สายสีชมพู',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('ข้อมูลสถานี')),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'ค้นหาสถานี',
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onChanged: searchStations,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('เลือกเส้นทางรถไฟ'),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: stations.values.toSet().map((colorName) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () => filterStations(colorName),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 65,
                                color: ColorUtils.getColorByLine(colorName),
                              ),
                              Positioned(
                                child: Center(
                                  child: Text(
                                    lineNames[colorName] ?? colorName,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  filterColor != null
                      ? Nameline[filterColor] ?? ''
                      : 'กรุณาเลือกสาย',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredStations.length,
                itemBuilder: (context, index) {
                  String station = filteredStations[index];
                  return ListTile(
                    title: Text(
                      station,
                      style: TextStyle(
                        color: ColorUtils.getColorByLine(stations[station]!),
                      ),
                    ),
                    subtitle: Text(stations[station]!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StationDetailScreen(
                            stationName: station,
                            lineColor: stations[station]!,
                            routeStations: stationConnections[station] ?? [],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

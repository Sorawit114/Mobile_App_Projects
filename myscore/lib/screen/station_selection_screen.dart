import 'package:flutter/material.dart';
import '../Widget/color.dart';
import '../models/station_data.dart';

class StationSelectionScreen extends StatefulWidget {
  @override
  _StationSelectionScreenState createState() => _StationSelectionScreenState();
}

class _StationSelectionScreenState extends State<StationSelectionScreen> {
  String? filterColor;
  String searchQuery = '';
  List<String> filteredStations = stations.keys.toList();

  @override
  void initState() {
    super.initState();
    // กำหนดค่าเริ่มต้นของ filterColor เป็นสายสีแรกที่อยู่ใน stations
    filterColor = stations.values.first;
    // เรียก filterStations เพื่อกรองสถานีโดยอัตโนมัติ
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
      if (filterColor != null) {
        filteredStations = stations.entries
            .where((entry) =>
                entry.value == filterColor &&
                entry.key.toLowerCase().contains(searchQuery))
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
      appBar: AppBar(title: Center(child: Text('ข้อมูลสถานี'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'ค้นหาสถานี',
                labelStyle: TextStyle(color: Colors.grey), // ปรับสีของ label
                prefixIcon:
                    Icon(Icons.search, color: Colors.grey), // วางไอคอนทางซ้าย
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0), // ปรับระยะห่างภายในช่องค้นหา
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // ขอบมน
                  borderSide:
                      BorderSide(color: Colors.grey, width: 1.0), // ขอบสีเทา
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // ขอบมนเหมือนกัน
                  borderSide:
                      BorderSide(color: Colors.grey, width: 1.0), // ขอบสีเทา
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // ขอบมนเมื่อเลือก
                  borderSide: BorderSide(
                      color: Colors.blue, width: 2.0), // ขอบสีน้ำเงินเมื่อเลือก
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
            // แสดงชื่อสายที่กรองได้
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
                      Navigator.pop(context, station);
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

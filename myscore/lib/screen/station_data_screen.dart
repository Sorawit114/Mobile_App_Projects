import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String selectedLanguage = "ภาษาไทย";
  String? filterColor;
  String searchQuery = '';
  late Map<String, String> stationNames;
  List<String> filteredStations = [];
  late Future<void> _initDataFuture;

  @override
  void initState() {
    super.initState();
    _initDataFuture = _loadLanguagePreference();
  }

  // Load language preference from shared preferences
  Future<void> _loadLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String language = prefs.getString('selectedLanguage') ?? "ภาษาไทย";
    setState(() {
      selectedLanguage = language;
      stationNames = selectedLanguage == "ภาษาไทย" ? stations : stationsE;
      filterColor = stationNames.values.first;
      filterStations(filterColor!);
    });
  }

  void filterStations(String color) {
    setState(() {
      filterColor = color;
      filteredStations = stationNames.entries
          .where((entry) => entry.value == color)
          .map((entry) => entry.key)
          .toList();
    });
  }

  void searchStations(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      if (searchQuery.isEmpty) {
        filterStations(filterColor!);
      } else {
        filteredStations = stationNames.keys.where((station) {
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
    return FutureBuilder(
      future: _initDataFuture, // Wait for the language preference to be loaded
      builder: (context, snapshot) {
        // If the data hasn't been loaded yet, show a loading indicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Center(child: Text('ข้อมูลสถานี')),
              backgroundColor: Colors.white,
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // If the data is loaded, display the actual content
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  onChanged: searchStations,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text('เลือกเส้นทางรถไฟ')],
                ),
                SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: stationNames.values.toSet().map((colorName) {
                      return GestureDetector(
                        onTap: () => filterStations(colorName),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 65,
                                  color: ColorUtils.getColorByLine(colorName),
                                ),
                                Center(
                                  child: Text(
                                    lineNames[colorName] ?? colorName,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                            color: ColorUtils.getColorByLine(
                                stationNames[station]!),
                          ),
                        ),
                        subtitle: Text(stationNames[station]!),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StationDetailScreen(
                                stationName: station,
                                lineColor: stationNames[station]!,
                                routeStations:
                                    stationConnections[station] ?? [],
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
      },
    );
  }
}

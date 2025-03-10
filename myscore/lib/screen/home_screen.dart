import 'package:flutter/material.dart';
import 'package:myscore/models/stationConnections.dart';
import 'package:myscore/screen/otherInfo_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screen/station_data_screen.dart';
import '../screen/station_selection_screen.dart';
import '../models/station_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String? fromStation;
  String? toStation;
  double fare = 0.0;

  void updateStations(String selectedStation, bool isFromStation) {
    setState(() {
      if (isFromStation) {
        fromStation = selectedStation;
        toStation = null;
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
    if (!stations.containsKey(from) || !stations.containsKey(to)) {
      return 0.0;
    }

    List<String> fromLines = getStationLines(from);
    List<String> toLines = getStationLines(to);

    double minFare = double.infinity;

    for (String fromLine in fromLines) {
      for (String toLine in toLines) {
        print(fromLine + " " + toLine);
        double fare;
        if (fromLine == toLine) {
          fare = calculateSingleLineFare(fromLine, from, to);
        } else {
          fare = calculateMultiLineFare(from, to, fromLine, toLine);
        }

        if (fare < minFare) {
          minFare = fare;
        }
      }
    }

    return minFare == double.infinity ? 0.0 : minFare;
  }

  List<String> getStationLines(String station) {
    if (stations.containsKey(station)) {
      return [stations[station]!];
    }
    return ["unknown"];
  }

  double calculateSingleLineFare(String line, String from, String to) {
    int fromIndex = stations.keys.toList().indexOf(from);
    int toIndex = stations.keys.toList().indexOf(to);
    int stationDistance = (toIndex - fromIndex).abs();

    if (line.contains("สายสีเขียว")) {
      return (18 + stationDistance).clamp(18, 62).toDouble();
    } else if (line.contains("สายสีน้ำเงิน")) {
      return (17 + stationDistance).clamp(17, 45).toDouble();
    } else if (line.contains("สายสีม่วง")) {
      return (14 + stationDistance).clamp(14, 20).toDouble();
    } else if (line.contains("สายสีแดง")) {
      return 20.0;
    } else if (line.contains("สายสีทอง")) {
      return 16.0;
    } else if (line.contains("สายสีเหลือง")) {
      return (15 + stationDistance).clamp(15, 45).toDouble();
    } else if (line.contains("ARL")) {
      return (15 + stationDistance).clamp(15, 45).toDouble();
    }

    return 0.0;
  }

  double calculateMultiLineFare(
      String from, String to, String fromLine, String toLine) {
    double minFare = double.infinity;
    String? bestTransferStation;

    for (var transferStation in stationConnections.keys) {
      if (stationConnections[transferStation]!.contains(fromLine) &&
          stationConnections[transferStation]!.contains(toLine)) {
        double fare1 = calculateSingleLineFare(fromLine, from, transferStation);
        double fare2 = calculateSingleLineFare(toLine, transferStation, to);
        double totalFare = fare1 + fare2;

        if (totalFare < minFare) {
          minFare = totalFare;
          bestTransferStation = transferStation;
        }
      }
    }

    if (bestTransferStation != null) {
      return minFare;
    } else {
      return 0.0;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreenContent(
        fromStation: fromStation,
        toStation: toStation,
        fare: fare,
        onStationSelected: updateStations,
      ),
      StationDataScreen(),
      OtherInfoScreen(),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'แผนที่',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.train_outlined),
            label: 'ข้อมูลเส้นทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'ข้อมูลอื่นๆ',
          ),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  final String? fromStation;
  final String? toStation;
  final double fare;
  final Function(String, bool) onStationSelected;

  const HomeScreenContent({
    super.key,
    this.fromStation,
    this.toStation,
    this.fare = 0.0,
    required this.onStationSelected,
  });

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  String selectedLanguage = "ภาษาไทย";

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString('selectedLanguage') ?? "ภาษาไทย";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          (selectedLanguage == "ภาษาไทย" ? "เลือกเส้นทาง" : "Choose route"),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final selectedStation = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationSelectionScreen(),
                  ),
                );
                if (selectedStation != null) {
                  widget.onStationSelected(selectedStation, true);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  children: [
                    const Icon(Icons.radio_button_checked, color: Colors.blue),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.fromStation ??
                            (selectedLanguage == "ภาษาไทย"
                                ? "สถานีต้นทาง"
                                : "Starting Point"),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(Icons.more_vert, color: Colors.grey),
            ),
            GestureDetector(
              onTap: () async {
                final selectedStation = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationSelectionScreen(),
                  ),
                );
                if (selectedStation != null) {
                  widget.onStationSelected(selectedStation, false);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.red),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.toStation ??
                            (selectedLanguage == "ภาษาไทย"
                                ? "สถานีปลายทาง"
                                : "Destination"),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 1.0,
                maxScale: 10.0,
                child: Image.asset(
                  'assets/test.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              (selectedLanguage == "ภาษาไทย"
                  ? 'ค่าโดยสาร: ${widget.fare.toStringAsFixed(2)} บาท'
                  : 'Result: ${widget.fare.toStringAsFixed(2)} THB'),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

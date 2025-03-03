import 'package:flutter/material.dart';
import '../screen/otherInfoScreen.dart';
import '../screen/station_data_screen.dart';
import '../screen/station_selection_screen.dart';
import '../models/station_data.dart';

class HomeScreen extends StatefulWidget {
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
    int fromIndex = stations.keys.toList().indexOf(from);
    int toIndex = stations.keys.toList().indexOf(to);
    int stationDistance = (toIndex - fromIndex).abs();
    return 15.0 + stationDistance - 1;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
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
      body: _screens[_selectedIndex],
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

class HomeScreenContent extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("เลือกเส้นทาง")),
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
                  onStationSelected(selectedStation, true);
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
                        fromStation ?? 'สถานีต้นทาง',
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
                  onStationSelected(selectedStation, false);
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
                        toStation ?? 'สถานีปลายทาง',
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
                minScale: 0.1,
                maxScale: 4.0,
                child: Image.asset(
                  'assets/test.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              'ค่าโดยสาร: ${fare.toStringAsFixed(2)} บาท',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

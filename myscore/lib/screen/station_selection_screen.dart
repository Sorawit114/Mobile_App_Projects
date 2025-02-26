import 'package:flutter/material.dart';
import '../models/station_data.dart';

class StationSelectionScreen extends StatefulWidget {
  @override
  _StationSelectionScreenState createState() => _StationSelectionScreenState();
}

class _StationSelectionScreenState extends State<StationSelectionScreen> {
  String? filterColor;
  String searchQuery = '';
  List<String> filteredStations = stations.keys.toList();

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

  Color getStationColor(String station) {
    return stations[station] != null
        ? getColorByLine(stations[station]!)
        : Colors.black;
  }

  Color getColorByLine(String line) {
    switch (line) {
      case 'สายสีเขียว':
        return Colors.green;
      case 'สายสีเขียวเข้ม':
        return Colors.greenAccent;
      case 'สายสีน้ำเงิน':
        return Colors.blue;
      case 'สายสีม่วง':
        return Colors.purple;
      case 'สายสีส้ม':
        return Colors.orange;
      case 'สายสีทอง':
        return Colors.amber;
      case 'สายสีแดง':
        return Colors.red;
      case 'สายสีแดงอ่อน':
        return Colors.redAccent;
      case 'สายสีเหลือง':
        return Colors.yellow;
      case 'สายสีชมพู':
        return Colors.pink;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เลือกสถานี')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'ค้นหาสถานี',
                border: OutlineInputBorder(),
              ),
              onChanged: searchStations,
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.circle, color: Colors.green),
                    onPressed: () => filterStations('สายสีเขียว'),
                  ),
                  IconButton(
                    icon: Icon(Icons.circle, color: Colors.greenAccent),
                    onPressed: () => filterStations('สายสีเขียวเข้ม'),
                  ),
                  IconButton(
                    icon: Icon(Icons.circle, color: Colors.blue),
                    onPressed: () => filterStations('สายสีน้ำเงิน'),
                  ),
                  IconButton(
                    icon: Icon(Icons.circle, color: Colors.purple),
                    onPressed: () => filterStations('สายสีม่วง'),
                  ),
                  IconButton(
                    icon: Icon(Icons.circle, color: Colors.orange),
                    onPressed: () => filterStations('สายสีส้ม'),
                  ),
                  IconButton(
                    icon: Icon(Icons.circle, color: Colors.amber),
                    onPressed: () => filterStations('สายสีทอง'),
                  ),
                  IconButton(
                    icon: Icon(Icons.circle, color: Colors.red),
                    onPressed: () => filterStations('สายสีแดง'),
                  ),
                  IconButton(
                    icon: Icon(Icons.circle, color: Colors.redAccent),
                    onPressed: () => filterStations('สายสีแดงอ่อน'),
                  ),
                  IconButton(
                    icon: Icon(Icons.circle, color: Colors.yellow),
                    onPressed: () => filterStations('สายสีเหลือง'),
                  ),
                  IconButton(
                    icon: Icon(Icons.circle, color: Colors.pink),
                    onPressed: () => filterStations('สายสีชมพู'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredStations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filteredStations[index],
                      style: TextStyle(
                          color: getStationColor(filteredStations[index])),
                    ),
                    onTap: () {
                      Navigator.pop(context, filteredStations[index]);
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

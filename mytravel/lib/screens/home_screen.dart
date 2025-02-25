import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../Widget/Destination.dart';
import '../Widget/Icon_tab.dart';
import '../Widget/SearchBar.dart';
import '../Widget/profile.dart';
import '../constants/colors.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List destinationAPT = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/items'));
    if (response.statusCode == 200) {
      setState(() {
        destinationAPT = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Row 1 - Proflie image
              ProfileWideget(),

              SizedBox(
                height: 15,
              ),

              //Row 2
              Text('Point of Interest',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: primaryColors, fontWeight: FontWeight.bold)),

              SizedBox(
                height: 15,
              ),

              //ROW 3 - SearchBar
              const Search_Bar(),

              SizedBox(
                height: 15,
              ),

              //ROW 4
              Icontab(),

              SizedBox(
                height: 15,
              ),

              //ROW 5
              Row(
                children: [
                  Text(
                    'Top Destination',
                    style: TextStyle(
                      fontSize: 25,
                      color: primaryColors,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.tune,
                    size: 25,
                    color: secondaryColors,
                  ),
                ],
              ),

              SizedBox(
                height: 15,
              ),

              //Row 6 - Display images
              GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                childAspectRatio: 0.75,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                children: List.generate(destinationAPT.length, (index) {
                  // var e = destinations[index];

                  return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: DestinationWidget(
                                  name: destinationAPT[index]['name'],
                                  image: destinationAPT[index]['image'],
                                  rate: destinationAPT[index]['rate'],
                                  location: destinationAPT[index]
                                      ['location']))));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

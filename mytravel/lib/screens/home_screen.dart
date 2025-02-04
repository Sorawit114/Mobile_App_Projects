import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/Widget/Destination.dart';
import 'package:mytravel/Widget/Icon_tab.dart';
import 'package:mytravel/Widget/SearchBar.dart';
import 'package:mytravel/Widget/profile.dart';
import 'package:mytravel/constants/colors.dart';
import 'package:mytravel/models/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
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
                children: List.generate(destinations.length, (index) {
                  var e = destinations[index];

                  return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: DestinationWidget(
                                  name: e.name,
                                  image: e.image,
                                  rate: e.rate,
                                  location: e.location))));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

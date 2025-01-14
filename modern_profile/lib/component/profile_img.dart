import 'package:flutter/material.dart';
import 'package:modern_profile/constant/constant.dart';

class ProfileImg extends StatelessWidget {
  const ProfileImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(alignment: Alignment.bottomLeft, children: [
        CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 80,
          child: CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage('images/profile.jpg'),
          ),
        ),
        CircleAvatar(
          backgroundColor: bgPrimaryColor,
          radius: 22,
          child: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Icon(
              Icons.edit,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
      ]),
    );
  }
}

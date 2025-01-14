import 'package:flutter/material.dart';
import 'package:modern_profile/component/profile_img.dart';
import 'package:modern_profile/component/profile_menu.dart';
import 'package:modern_profile/constant/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileImg(),

          SizedBox(
            height: 20,
          ),

          Text(
            'Sorawit Kamboonlue',
            style: textTitle,
          ),

          Text('**************@email.com'),

          SizedBox(
            height: 10,
          ),

          Container(
            width: 90,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
              child: Text(
                'Edit Profile',
                style: textBtn,
              ),
            ),
          ),

          //Profile Menu
          ProfileMenu(
            title: 'Settings',
            icon: Icons.settings,
          ),
          ProfileMenu(
            title: 'Home',
            icon: Icons.home,
          ),
          ProfileMenu(
            title: 'User',
            icon: Icons.person,
          ),
          ProfileMenu(
            title: 'Data',
            icon: Icons.article,
          ),
          ProfileMenu(
            title: 'Work',
            icon: Icons.work,
          ),
          ProfileMenu(
            title: 'Exit',
            icon: Icons.exit_to_app,
          ),
        ],
      ),
    );
  }
}

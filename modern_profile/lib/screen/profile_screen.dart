import 'package:flutter/material.dart';
import 'package:modern_profile/constant/constant.dart';
import 'package:modern_profile/screen/edit_profile_screen.dart';
import 'package:modern_profile/screen/favorite_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedItem = 0;

  void _navigationBottomNavBar(int index) {
    setState(() {
      _selectedItem = index;
      print(index);
    });
  }

  final List<Widget> _pages = [
    const Text('Home'),
    const Edit_Profile_Screen(),
    const Favorite_Screen(),
    const Text('Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: iconPrimaryColor,
        ),
        title: Center(
          child: Text(
            "Edit Profile",
            style: textTitle,
          ),
        ),
        actions: [
          Icon(
            Icons.exit_to_app,
            size: 24,
            color: iconPrimaryColor,
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: _pages[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        onTap: _navigationBottomNavBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: iconPrimaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
              color: iconPrimaryColor,
            ),
            label: 'Edit Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: iconPrimaryColor,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
              color: iconPrimaryColor,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

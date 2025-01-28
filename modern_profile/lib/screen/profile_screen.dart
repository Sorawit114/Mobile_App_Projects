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

  final List<String> _title = ['Home', 'Edit Profile', 'Favorite', 'Setting'];

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
        backgroundColor: bgSecondaryColor,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: iconPrimaryColor,
        ),
        title: Center(
          child: Text(
            _title[_selectedItem],
            style: textTitle.copyWith(color: Colors.white),
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
        backgroundColor: bgSecondaryColor,
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

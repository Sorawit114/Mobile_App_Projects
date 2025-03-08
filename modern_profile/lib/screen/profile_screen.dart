import 'package:flutter/material.dart';
import 'package:modern_profile/constant/constant.dart';
import 'package:modern_profile/screen/edit_profile_screen.dart';
import 'package:modern_profile/screen/favorite_screen.dart'; // Correct import
import 'package:modern_profile/screen/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedItem = 0;

  // สร้างตัวแปรสำหรับเก็บรายการโปรด
  List<String> favoriteItems = [];
  List<String> removedItems = [];

  void _navigationBottomNavBar(int index) {
    setState(() {
      _selectedItem = index;
      print(index);
    });
  }

  final List<String> _title = ['Home', 'Edit Profile', 'Favorite', 'Removed'];

  @override
  Widget build(BuildContext context) {
    // สร้าง _pages ภายใน build method
    final List<Widget> pages = [
      HomeScreen(),
      const Edit_Profile_Screen(),
      Favorite_Screen(),
      const Text('Remove'),
    ];

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
      body: pages[_selectedItem], // แสดงหน้าแต่ละหน้า
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
              Icons.delete,
              size: 30,
              color: iconPrimaryColor,
            ),
            label: 'Removed',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

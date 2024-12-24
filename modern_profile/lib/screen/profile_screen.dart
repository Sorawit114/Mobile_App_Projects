import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 100,
              child: CircleAvatar(
                radius: 95,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

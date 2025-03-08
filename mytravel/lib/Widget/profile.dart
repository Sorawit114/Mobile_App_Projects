import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytravel/onboardingScreen.dart';
import '../constants/colors.dart';

class ProfileWideget extends StatelessWidget {
  const ProfileWideget({
    super.key,
  });

  Future<void> singOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/max.jpg'),
              radius: 30,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () => singOut(context),
          icon: Icon(
            Icons.logout_outlined,
            size: 25.0,
            color: secondaryColors,
          ),
        ),
      ],
    );
  }
}

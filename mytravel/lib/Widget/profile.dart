import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';

class ProfileWideget extends StatelessWidget {
  const ProfileWideget({
    super.key,
  });

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
        Icon(
          Icons.menu,
          size: 25.0,
          color: secondaryColors,
        ),
      ],
    );
  }
}

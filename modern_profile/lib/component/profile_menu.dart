// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:modern_profile/constant/constant.dart';

class ProfileMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  const ProfileMenu({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 200,
          height: 40,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: bgSecondaryColor,
                child: Icon(
                  icon,
                  size: 24,
                  color: iconPrimaryColor,
                ),
              ),
              Spacer(),
              Text(
                title,
                style: textSubTitle,
              ),
              Spacer(),
              CircleAvatar(
                radius: 16,
                backgroundColor: bgSecondaryColor,
                child: Icon(
                  Icons.arrow_forward,
                  size: 10,
                  color: iconSecondaryColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

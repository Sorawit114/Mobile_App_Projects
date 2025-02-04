import 'package:flutter/material.dart';
import 'package:mytravel/Widget/Icon_edit.dart';
import 'package:mytravel/constants/colors.dart';

class Icontab extends StatelessWidget {
  const Icontab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon_edit(
          title: 'Forest',
          color: forestColor,
          icon: Icons.forest,
        ),
        Spacer(),
        Icon_edit(
          title: 'Fog',
          color: fogColor,
          icon: Icons.foggy,
        ),
        Spacer(),
        Icon_edit(
          title: 'Animal',
          color: animalColor,
          icon: Icons.pets,
        ),
        Spacer(),
        Icon_edit(
          title: 'Mount',
          color: mountainsColor,
          icon: Icons.filter_hdr,
        ),
        Spacer(),
        Icon_edit(
          title: 'Ocean',
          color: oceanColor,
          icon: Icons.water,
        ),
        Spacer(),
      ],
    );
  }
}

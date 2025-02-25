import 'package:flutter/material.dart';
import '../constants/colors.dart';

class Search_Bar extends StatelessWidget {
  const Search_Bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 5),
        hintText: 'Spot area',
        hintStyle: TextStyle(color: secondaryColors.withOpacity(0.8)),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

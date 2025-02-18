import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/constants/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onTap,
    required this.labelText,
  });

  final Function()? onTap;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(25.0),
        //margin: EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
            color: primaryColors, borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(
            labelText,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge,
              fontSize: 25,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

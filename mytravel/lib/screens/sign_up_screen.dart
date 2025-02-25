import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../screens/sign_in_screen.dart';
import '../Widget/mybutton.dart';
import '../Widget/mytextfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              'Welcome to our community.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              '\nTo get started, please provide your information and create an account.',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            MyTextField(
              nameController: nameController,
              controller: nameController,
              labelText: 'Name',
              hintText: 'Enter your name',
              obscureText: false,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              nameController: emailController,
              controller: emailController,
              labelText: 'Email',
              hintText: 'Enter your email',
              obscureText: false,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              nameController: passwordController,
              controller: passwordController,
              labelText: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              nameController: repasswordController,
              controller: repasswordController,
              labelText: 'Confirm password',
              hintText: 'Enter your password again',
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
              onTap: () {},
              labelText: 'Sign Up',
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have a member?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(width: 2),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign in.',
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: mountainsColor),
                    ))
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

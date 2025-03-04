import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/home_screen.dart';
import '../Widget/mybutton.dart';
import '../Widget/mytextfield.dart';
import '../constants/colors.dart';
import '../screens/sign_up_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();

  signInWithEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog(context, 'Login successful.');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      print(emailController.text);
      print(passwordController.text);
      print('Failed with error code: ${e.code}');
      print(e.message); // Fixed the issue here

      if (e.code == 'invalid-email') {
        _showMyDialog(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _showMyDialog(context, 'Wrong password provided for that user.');
      }
    }
  }

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
              'Hello,ready to get started?',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              '\nplease sign in with your email and password.',
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
              nameController: emailController,
              controller: emailController,
              labelText: 'Email',
              hintText: 'Enter your email.',
              obscureText: false,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              nameController: passwordController,
              controller: passwordController,
              labelText: 'Password',
              hintText: 'Enter your password.',
              obscureText: false,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: mountainsColor),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
              onTap: () => signInWithEmailAndPassword(context),
              labelText: 'Sign In',
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Or continue with',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
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
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Register now.',
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

  // Show dialog with message
  void _showMyDialog(BuildContext context, String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.amberAccent,
          title: const Text('Alert'),
          content: Text(txtMsg),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:all_authentication/Components/my_container.dart';
import 'package:all_authentication/Pages/anonymous_sign_in_page.dart';
import 'package:all_authentication/Pages/facebook_sign_in_page.dart';
import 'package:all_authentication/Pages/google_sign_in_page.dart';
import 'package:all_authentication/Pages/phone_sign_in_page.dart';
import 'package:all_authentication/Pages/sign_in_page.dart';
import 'package:all_authentication/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyContainer(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpPage();
                }));
              },
              text: 'Email/Password Sign Up',
            ),
            const SizedBox(
              height: 20,
            ),
            MyContainer(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignInPage();
                }));
              },
              text: 'Email/Password Sign In',
            ),
            const SizedBox(
              height: 20,
            ),
            MyContainer(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PhoneSignIn();
                }));
              },
              text: 'Phone Sign In',
            ),
            const SizedBox(
              height: 20,
            ),
            MyContainer(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GoogleSignInPage();
                }));
              },
              text: 'Google Sign In',
            ),
            const SizedBox(
              height: 20,
            ),
            MyContainer(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FacebookSignInPage();
                }));
              },
              text: 'Facebook Sign In',
            ),
            const SizedBox(
              height: 20,
            ),
            MyContainer(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AnonymousSignInPage();
                }));
              },
              text: 'Anonymous Sign In',
            ),
          ],
        ),
      ),
    );
  }
}

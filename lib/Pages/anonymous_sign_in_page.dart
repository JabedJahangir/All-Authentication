import 'package:all_authentication/Components/my_container.dart';
import 'package:all_authentication/Components/my_text_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnonymousSignInPage extends StatelessWidget {
  AnonymousSignInPage({
    super.key,
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Anonymous Sign Up',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: emailController,
            hintText: 'Email Adress',
            obscureText: false,
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            controller: passController,
            hintText: 'Password',
            obscureText: true,
          ),
          const SizedBox(
            height: 15,
          ),
          MyContainer(text: 'Sign Up', onTap: () {})
        ],
      ),
    );
  }
}

import 'package:all_authentication/Components/my_container.dart';
import 'package:all_authentication/Components/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({
    super.key,
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign In',
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
          MyContainer(text: 'Sign In', onTap: signIn)
        ],
      ),
    );
  }
}

import 'package:all_authentication/Components/my_container.dart';
import 'package:all_authentication/Components/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();

  void signUp() async {
    if (passController.text != confirmPassController.text) {
      // Show the dialog for password mismatch

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Password Mismatch"),
            content: Text("The passwords you entered do not match."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close'),
              ),
            ],
          );
        },
      );

      return; // Stop further execution if passwords do not match
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      // Additional success logic (e.g., navigate to another page or show success message)
    } on FirebaseAuthException catch (e) {
      // Handle Firebase errors
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error: ${e.code}"),
              content: Text(e.message ?? 'No detailed error message available'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      });
    } catch (e) {
      // Handle unexpected errors
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Unexpected Error"),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign Up',
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
            height: 10,
          ),
          MyTextField(
            controller: confirmPassController,
            hintText: 'Confirm Password',
            obscureText: true,
          ),
          const SizedBox(
            height: 15,
          ),
          MyContainer(
            text: 'Sign Up',
            onTap: signUp,
          )
        ],
      ),
    );
  }
}

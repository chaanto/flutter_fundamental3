import 'package:flutter/material.dart';
import 'package:flutter_fundamental3/auth_services.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            width: 300,
            height: 100,
            child: TextField(
              controller: emailController,
            ),
          ),
          Container(
            width: 300,
            height: 100,
            child: TextField(
              controller: passwordController,
            ),
          ),
          TextButton(
            child: Text('Sign In'),
            onPressed: () async {
              await AuthServices.signIn(
                  emailController.text, passwordController.text);
            },
          ),
          TextButton(
            child: Text('Sign Up'),
            onPressed: () async {
              await AuthServices.signUp(
                  emailController.text, passwordController.text);
            },
          ),
          TextButton(
            child: Text('Sign in Anonynous'),
            onPressed: () async {
              await AuthServices.signInAnonymous();
            },
          ),
        ]),
      ),
    );
  }
}

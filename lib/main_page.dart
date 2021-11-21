import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental3/auth_services.dart';

class MainPage extends StatelessWidget {
  final User user;
  MainPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page")),
      body: Center(
        child: Column(children: <Widget>[
          Text("You're login here with id " + (user.uid)),
          TextButton(
              onPressed: () async {
                await AuthServices.singOut();
              },
              child: Text("Sign Out"))
        ]),
      ),
    );
  }
}

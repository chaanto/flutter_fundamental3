import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental3/auth_services.dart';
import 'package:flutter_fundamental3/database_services.dart';
import 'package:flutter_fundamental3/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return StreamProvider.value(
    //   value: AuthServices.firebaseUserStream,
    //   initialData: null,
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Wrapper(),
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cloud Fire Store"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      DatabaseServices.createOrUpdateProduct("1",
                          name: "Barang", price: 10);
                    },
                    child: Text("ADD DATA")),
                TextButton(
                    onPressed: () {
                      DatabaseServices.createOrUpdateProduct("1",
                          name: "Barang", price: 30);
                    },
                    child: Text("Edit DATA")),
                TextButton(
                    onPressed: () async {
                      DocumentSnapshot snapshot =
                          await DatabaseServices.getProduct("1");
                      print(snapshot.get('nama'));
                    },
                    child: Text("GET DATA")),
                TextButton(
                    onPressed: () async {
                      DatabaseServices.deleteProduct("1");
                    },
                    child: Text("DELETE DATA")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

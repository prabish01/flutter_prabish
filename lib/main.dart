import 'package:flutter/material.dart';
import 'package:login_validation/loginPage.dart';
import 'loginPage.dart';
import 'homepage.dart';
import 'tapPage.dart';
// import 'class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _name = TextEditingController();  
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: loginPage());
  }
}

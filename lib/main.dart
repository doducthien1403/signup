import 'package:flutter/material.dart';
import 'package:signup/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("AppMobile"),
          ),
          body: SignUp(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:posturx/sign_up_screen.dart';
import 'login_screen.dart';
import 'home.dart';
import 'sign_up_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PosturX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Signin(),
        '/home': (context) => HomePage(),
        '/Signup' : (context) => Signup()
      },
    );
  }
}

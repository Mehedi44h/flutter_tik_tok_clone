import 'package:flutter/material.dart';
import 'package:tik_tok_clone/constant.dart';
import 'package:tik_tok_clone/home.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/views/screens/auth/login_screen.dart';
import 'package:tik_tok_clone/views/screens/auth/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tik Tok clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: SignUpScreen(),
    );
  }
}

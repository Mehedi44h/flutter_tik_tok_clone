import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok_clone/constant.dart';
import 'package:tik_tok_clone/controllers/auth_controller.dart';
import 'package:tik_tok_clone/home.dart';
import 'package:get/get.dart';
import 'package:tik_tok_clone/views/screens/auth/login_screen.dart';
import 'package:tik_tok_clone/views/screens/auth/signup_screen.dart';
import 'package:tik_tok_clone/views/screens/video_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tik Tok clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: VideoScreen(),
    );
  }
}

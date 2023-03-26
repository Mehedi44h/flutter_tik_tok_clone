import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok_clone/controllers/auth_controller.dart';
import 'package:tik_tok_clone/views/screens/add_video_screen.dart';
import 'package:tik_tok_clone/views/screens/video_screen.dart';

final pages = [
  VideoScreen(),
  Text('search'),
  AddVideoScreen(),
  Text('message'),
  Text('profile'),
];
// colors
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// firebase instance
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
//  controller

var authController = AuthController.instance;

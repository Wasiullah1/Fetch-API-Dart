import 'package:api/Screen/imageupload.dart';
import 'package:api/Screen/signup.dart';
import 'package:api/Screen/simplemodelapi.dart';
import 'package:api/Screen/userapi.dart';
import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadImage(),
    );
  }
}

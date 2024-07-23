import 'package:api_tutorial_1/signup_withRestApi.dart';
import 'package:flutter/material.dart';
import 'four.dart';
import 'three.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signup(),
    );
  }
}

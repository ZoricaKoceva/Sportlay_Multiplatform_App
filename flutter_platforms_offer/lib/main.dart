import 'package:flutter/material.dart';
import 'package:platforms-offer/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Понуда на платформите',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}

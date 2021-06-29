import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'views/main_screen.dart';

void main() {
  runApp(CryptoTrackerApp());
}

class CryptoTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Tracker',
      home: MainScreen(),
    );
  }
}

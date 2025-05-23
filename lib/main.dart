import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/bottom_tabbar/bottom_tabbar_screen.dart';
import './screen/WalkThroughPage/walkthrough_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tournament App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const WalkthroughScreen(),
    );
  }
}

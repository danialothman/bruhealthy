import 'package:flutter/material.dart';
import 'screens/main_page.dart';

void main() {
  runApp(const BruHealthyApp());
}

class BruHealthyApp extends StatelessWidget {
  const BruHealthyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BruHealthy',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const MainPage(),
    );
  }
}

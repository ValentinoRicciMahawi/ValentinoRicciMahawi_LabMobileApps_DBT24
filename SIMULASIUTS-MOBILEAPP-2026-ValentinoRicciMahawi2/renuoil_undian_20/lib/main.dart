import 'package:flutter/material.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const ReNuOilApp());
}

class ReNuOilApp extends StatelessWidget {
  const ReNuOilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReNuOil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFC107)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MainNavigation(),
    );
  }
}

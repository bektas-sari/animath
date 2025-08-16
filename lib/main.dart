import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AnimathApp());
}

class AnimathApp extends StatelessWidget {
  const AnimathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animath',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          displaySmall: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 18),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

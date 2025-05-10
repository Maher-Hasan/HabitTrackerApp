import 'package:flutter/material.dart';
import 'home_screen.dart';
//import 'add_habit_screen.dart';
//import 'profile_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      home: HomeScreen(), // Navigation handled inside
    );
  }
}

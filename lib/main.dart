import 'package:flutter/material.dart';
import 'package:mediator/screens/home_screen.dart';
import 'package:mediator/utils/theme.dart';

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
        title: 'Chat App',
        theme: AppTheme().light,
        darkTheme: AppTheme().dark,
        themeMode: ThemeMode.light,
        home: HomeScreen());
  }
}

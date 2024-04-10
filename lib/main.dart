import 'package:flutter/material.dart';
import 'package:termproject/login/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Big Cinema',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFB71C1C),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFF212121),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFB71C1C),
        ),
      ),
      home: const LoginPage(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_with_docs/accessibility/accessibility.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Bu semantics chegaralarini ko'rsatadi
      // showSemanticsDebugger: true,
      title: 'Namer App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: ProfileScreen(),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('오늘의 웹툰'),
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
        foregroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black,
      ),
    );
  }
}

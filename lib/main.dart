import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'dart:io';

// 이미지 로드 시 403 에러 해결 위해 추가
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // 위젯은 ID 같은 식별자 역할을 하는 key가 있기 때문에 플러터가 위젯을 식별할 수 있음
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo.shade400,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          // backgroundColor: Colors.white,
          foregroundColor: Colors.indigo.shade400,
          elevation: 2,
          surfaceTintColor: Colors.white, // elevation 추가 후 앱바 어두워지는 문제 해결
          shadowColor: Colors.black,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

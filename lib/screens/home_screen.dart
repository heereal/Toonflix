import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  // api 데이터를 호출하는 함수
  void waitForWebtoons() async {
    // static 지정을 하면 'ApiService' 클래스 자체가 해당 함수를 소유하는 형태가 됨
    // 따라서 인스턴스 생성 없이 함수를 호출할 수 있음
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {}); // UI 새로고침
  }

  @override
  // initState는 build 메소드가 호출이 되기전에 딱 한 번 호출됨
  void initState() {
    super.initState();
    // waitForWebtoons 메소드 호출 후 데이터를 받기 전에 build 메소드를 먼저 실행함
    // waitForWebtoons -> build-> 데이터 도착 -> setState -> build
    waitForWebtoons();
  }

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

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                // Expanded는 화면의 남은 공간을 차지하는 위젯
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  // 메소드로 추출
  // 여러 항목을 나열하는데 최적화된 위젯
  // ListView -> ListView.builder -> ListView.separated
  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      // itemBuilder는 리스트뷰의 아이템을 만드는 역할을 함
      // 모든 아이템을 한번에 build 하지 않으며 사용자가 보고있는 아이템만 build함
      // 사용자가 보고있지 않은 아이템은 메모리에서 삭제됨
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            SizedBox(
              width: 200,
              child: Image.network(
                webtoon.thumb,
                // 403 에러 해결 위해 추가
                headers: const {
                  'Referer': 'https://comic.naver.com',
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        );
      },
      // 각 아이템 사이에 렌더링됨
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}

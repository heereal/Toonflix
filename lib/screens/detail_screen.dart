import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/episode_widget.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  late final Future<WebtoonDetailModel> webtoon;
  late final Future<List<WebtoonEpisodeModel>> episodes;

  // 생성자 안에서 초기화를 해 주면 이미 id를 인자로 받아온 상태에서 사용하기 때문에
  // StatelessWidget에서도 argument가 있는 메소드 사용 가능
  DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  })  : webtoon = ApiService.getToonById(id),
        episodes = ApiService.getLatestEpisodesById(id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('오늘의 웹툰'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo[400],
        elevation: 2,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
      ),
      // 스크롤 overflow 문제 해결
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              // 화면 전환 시 애니메이션을 제공해주는 위젯
              // Hero 위젯을 두 개의 화면에 각각 추가하고, 각각의 위젯에 같은 태그를 추가하는 방식으로 사용
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: id,
                    child: Container(
                      width: 200,
                      // 자식의 부모 영역 침범을 제어함 (BorderRadius 적용 위해 추가)
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                      child: Image.network(
                        thumb,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    );
                  }
                  return const Text('...');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // 데이터의 양이 10개밖에 되지 않기 때문에 ListView 대신 Column 사용
              // ListView는 데이터가 많아서 최적화가 요구되는 상황에 사용
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(episode: episode, webtoonId: id)
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

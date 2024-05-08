import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  // 어떤 프로퍼티(webtoon)를 초기화할 때 다른 프로터피(id)에는 접근할 수 없음
  // 메소드 실행을 위해 StatelessWidget -> StatefulWidget으로 변경 (메소드에 argument를 전달해야 하는 경우)
  // Future<WebtoonDetailModel> webtoon = ApiService.getToonById(id); 불가능

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

// 데이터(title 등 프로퍼티)는 StatefulWidget(DetailScreen)으로 전달됨
// -> 이 데이터를 State 클래스(_DetailScreenState)에서 받아오기 위해 widget을 참조하는 방법을 사용함
// widget은 부모 위젯(DetailScreen)을 의미함 -> SatefulWidget의 build 메소드에서는 widget.title로 접근
class _DetailScreenState extends State<DetailScreen> {
  // Constructor에서는 widget을 참조할 수 없기 때문에 변수를 선언만 함
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  // initState에서는 widget으로 참조 가능
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.indigo[400],
        foregroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              // 화면 전환 시 애니메이션을 제공해주는 위젯
              // Hero 위젯을 두 개의 화면에 각각 추가하고, 각각의 위젯에 같은 태그를 추가하는 방식으로 사용
              Hero(
                tag: widget.id,
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
                    widget.thumb,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

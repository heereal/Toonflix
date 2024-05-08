import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  Webtoon(WebtoonModel webtoon, {super.key})
      : title = webtoon.title,
        thumb = webtoon.thumb,
        id = webtoon.id;

  @override
  Widget build(BuildContext context) {
    // 탭 이벤트를 감지하는 위젯
    return GestureDetector(
      // 버튼을 탭 했을 때 발생하는 이벤트
      onTap: () {
        // Navigator로 새 route를 push함
        Navigator.push(
          context,
          // 단순한 위젯을 route로 변환 후 애니메이션 효과를 추가해서 스크린처럼 보이게 함
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            // App Bar에 뒤로가기가 아닌 닫기 버튼이 생성됨
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Container(
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
          const SizedBox(
            height: 8,
          ),
          // TODO: 텍스트 넘치는 것 해결
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

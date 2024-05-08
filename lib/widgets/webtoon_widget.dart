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
    // 탭, 드래그. 줌 등의 동작을 감지하는 위젯
    return GestureDetector(
      // 버튼을 탭 했을 때 발생하는 이벤트
      onTap: () {
        // Navigator로 새 route를 push함 (현재 위젯 위에 route 하는 다른 위젯을 올려줌)
        Navigator.push(
          context,
          // 단순한 위젯을 route로 변환하고 애니메이션 효과를 추가해서 스크린처럼 보이게 함
          // 애니메이션 설정 위해 MaterialPageRoute에서 PageRouteBuilder로 위젯 변경
          PageRouteBuilder(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(-1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween = Tween(begin: begin, end: end).chain(
                CurveTween(
                  curve: curve,
                ),
              );
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, anmation, secondaryAnimation) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            // App Bar에 뒤로가기가 아닌 닫기 버튼이 생성됨
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
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
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 200,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

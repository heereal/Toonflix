import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
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
        ],
      ),
    );
  }
}

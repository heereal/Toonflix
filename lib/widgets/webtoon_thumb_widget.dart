import 'package:flutter/material.dart';

class WebtoonThumb extends StatelessWidget {
  final String thumb;

  const WebtoonThumb({
    super.key,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

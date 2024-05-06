class WebtoonModel {
  final String title, thumb, id;

  // 프로퍼티 초기화
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}

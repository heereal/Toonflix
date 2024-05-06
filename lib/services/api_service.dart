import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  // static 키워드를 사용함으로써 이미 메모리에 할당되어 있음
  // 따라서 static이 붙은 변수나 함수는 클래스 객체를 생성하지 않고도 사용할 수 있음
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  // 비동기 함수의 반환값 타입은 Future
  // Future는 당장 완료될 수 없는 작업이라는 것을 의미하며, '미래'에 받을 값의 타입을 알려줌
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');
    // await으로 서버가 응답을 반환할 때까지 기다림
    // get 메소드의 응답값은 Future<Response> 타입 (함수가 완료되면 Response를 반환할 것)
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // String 타입인 body를 JSON 형태로 디코딩
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        // JSON 데이터를 Dart Class로 변환
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    } else {
      throw Error();
    }
  }
}

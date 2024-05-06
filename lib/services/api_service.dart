import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  // 비동기 함수이기 때문에 Future를 반환함 (Future는 '미래'에 받을 값의 타입을 알려줌)
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');
    // await으로 서버가 응답을 반환할 때까지 기다림
    // get 메소드의 응답값은 Future<Response> 타입 (함수가 완료되면 Response를 반환할 것)
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // String 타입인 body를 JSON 형태로 디코딩
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    } else {
      throw Error();
    }
  }
}

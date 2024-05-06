import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    // 서버가 응답을 반환할 때까지 기다림 (async programming)
    // get 메소드의 응답값은 Future<Response> 타입
    // -> 미래에 받을 결과 값의 타입을 알려줌 (함수가 완료되면 Response를 반환할 것)
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Error();
    }
  }
}

// future는 미래에 받을 값의 타입을 알려줌

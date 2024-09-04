import 'package:http/http.dart' as http;
class Apiprovider {
  Future<http.Response> exchangedata() async {
    final response = await http.get(
      Uri.parse('https://www.jsonkeeper.com/b/6Z9C'),
    );
    return response;
  }
}
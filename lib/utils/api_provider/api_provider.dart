import 'package:http/http.dart' as http;
import 'package:mock_mechine_test2/utils/api.dart';

class Apiprovider {
  Future<http.Response> exchangedata() async {
    final response = await http.get(
      Uri.parse('https://v6.exchangerate-api.com/v6/$apikey/latest/USD'),
    );
    return response;
  }
}

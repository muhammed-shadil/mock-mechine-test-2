import 'package:http/http.dart' as http;
import 'package:mock_mechine_test2/utils/api_provider/api_provider.dart';

class Apirepository {
  final Apiprovider apiprovider = Apiprovider();
  Future<http.Response> exchangedata() async {
    return apiprovider.exchangedata();
  }
}

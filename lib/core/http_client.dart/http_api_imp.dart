import 'package:ghibli_movies/core/http_client.dart/http_client.dart';
import 'package:http/http.dart' as http;

class HttpApiImp implements HttpClient {
  @override
  Future<HttpResponse> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}

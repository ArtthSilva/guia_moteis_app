import 'package:http/http.dart';
import 'package:result_dart/result_dart.dart';

class ClientHttp {
  final Client _client;

  ClientHttp(this._client);

  AsyncResult<Response> get(String url) async {
    try {
      final response = await _client.get(Uri.parse(url));
      return Success(response);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}

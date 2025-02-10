 
import 'dart:convert';
import 'dart:developer';
import 'package:guia_moteis_app/data/services/client_http.dart';
import 'package:guia_moteis_app/domain/entities/motel_entity.dart';
import 'package:result_dart/result_dart.dart';

class MotelClientHttp {
  final ClientHttp _client;

  MotelClientHttp(this._client);

AsyncResult<List<MotelEntity>> getMotels() async {
  final response = await _client.get("https://www.jsonkeeper.com/b/1IXK");

  return response.fold(
    (successResponse) {
      log("Resposta da API: ${successResponse.body}");
      try {
        final jsonData = jsonDecode(utf8.decode(successResponse.bodyBytes));
        if (jsonData['data'] != null && jsonData['data']['moteis'] is List) {
          final motels = (jsonData['data']['moteis'] as List)
              .map((e) => MotelEntity.fromJson(e))
              .toList();
          return Success(motels);
        } else {
          return Failure(Exception("Formato inesperado de JSON"));
        }
      } catch (e) {
        return Failure(Exception('Falha no parsing: $e'));
      }
    },
    (failure) {
      log("Erro na requisição: $failure");
      return Failure(failure);
    },
  );
}

}
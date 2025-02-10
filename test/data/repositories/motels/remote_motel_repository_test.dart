import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guia_moteis_app/data/repositories/motels/remote_motel_repository.dart';
import 'package:guia_moteis_app/data/services/motel/motel_client_http.dart';
import 'package:guia_moteis_app/domain/entities/motel_entity.dart';
import 'package:result_dart/result_dart.dart';

class MockMotelClientHttp extends Mock implements MotelClientHttp {}

void main() {
  late RemoteMotelRepository repository;
  late MockMotelClientHttp mockClient;

  setUp(() {
    mockClient = MockMotelClientHttp();
    repository = RemoteMotelRepository(mockClient);
  });

  group('RemoteMotelRepository', () {
    test('Deve retornar uma lista de motéis quando a requisição for bem-sucedida', () async {
      final mockMotels = [
        MotelEntity(
          name: 'Motel Teste',
          logo: 'logo.png',
          neighborhood: 'Centro',
          distance: 2.5,
          favoriteCount: 10,
          suites: [],
          reviewCount: 5,
          rating: 4.5,
        ),
      ];

      when(() => mockClient.getMotels()).thenAnswer((_) async => Success(mockMotels));

      final result = await repository.getMotels();

      expect(result, mockMotels);
      verify(() => mockClient.getMotels()).called(1);
    });

    test('Deve lançar uma exceção quando a requisição falhar', () async {
      when(() => mockClient.getMotels()).thenAnswer((_) async => Failure(Exception('Erro de rede')));

      expect(() => repository.getMotels(), throwsException);
      verify(() => mockClient.getMotels()).called(1);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_app/domain/entities/motel_entity.dart';
import 'package:guia_moteis_app/domain/entities/period_entity.dart';
import 'package:guia_moteis_app/domain/entities/suite_entity.dart';

void main() {
  group('MotelEntity', () {
    test('deve criar a partir de JSON corretamente', () {
      final json = {
        'fantasia': 'Motel Le Nid',
        'logo': 'logo.png',
        'bairro': 'Centro',
        'distancia': 1.5,
        'qtdFavoritos': 100,
        'suites': [
          {
            'nome': 'Suíte Premium',
            'fotos': ['foto1.jpg'],
            'itens': [{'nome': 'Hidromassagem'}],
            'categoriaItens': [{'nome': 'Luxo', 'icone': 'icon.png'}],
            'periodos': [{
              'tempoFormatado': '3h',
              'tempo': '3',
              'valor': 200.0,
              'valorTotal': 180.0,
              'temCortesia': false,
              'desconto': {'desconto': 10.0}
            }]
          }
        ],
        'qtdAvaliacoes': 150,
        'media': 4.5
      };

      final motel = MotelEntity.fromJson(json);

      expect(motel.name, 'Motel Le Nid');
      expect(motel.suites.length, 1);
      expect(motel.suites.first.periods.first.discount?.discount, 10.0);
    });
  });

  group('PeriodEntity', () {
    test('deve lidar com desconto nulo', () {
      final json = {
        'tempoFormatado': '3h',
        'tempo': '3',
        'valor': 200.0,
        'valorTotal': 200.0,
        'temCortesia': false
      };

      final period = PeriodEntity.fromJson(json);

      expect(period.discount, isNull);
      expect(period.totalValue, 200.0);
    });
  });

  group('SuiteEntity', () {
    test('deve converter categorias corretamente', () {
      final json = {
        'nome': 'Suíte Luxo',
        'fotos': ['foto1.jpg'],
        'itens': [{'nome': 'Sauna'}],
        'categoriaItens': [
          {'nome': 'Lazer', 'icone': 'lazer.png'},
          {'nome': 'Conforto', 'icone': 'conforto.png'}
        ],
        'periodos': []
      };

      final suite = SuiteEntity.fromJson(json);

      expect(suite.categoryItems.length, 2);
      expect(suite.categoryItems.first.name, 'Lazer');
    });
  });
}
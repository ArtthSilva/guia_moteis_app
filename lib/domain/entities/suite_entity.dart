
import 'package:guia_moteis_app/domain/entities/category_entity.dart';
import 'package:guia_moteis_app/domain/entities/item_entity.dart';
import 'package:guia_moteis_app/domain/entities/period_entity.dart';

class SuiteEntity {
  final String name;
  final List<String> photos;
  final List<ItemEntity> items;
  final List<CategoryItemEntity> categoryItems;
  final List<PeriodEntity> periods;

  SuiteEntity({
    required this.name,
    required this.photos,
    required this.items,
    required this.categoryItems,
    required this.periods,
  });

  factory SuiteEntity.fromJson(Map<String, dynamic> json) {
    return SuiteEntity(
      name: json['nome'],
      photos: (json['fotos'] as List).cast<String>(),
      items: (json['itens'] as List)
          .map((e) => ItemEntity.fromJson(e))
          .toList(),
      categoryItems: (json['categoriaItens'] as List)
          .map((e) => CategoryItemEntity.fromJson(e))
          .toList(),
      periods: (json['periodos'] as List)
          .map((e) => PeriodEntity.fromJson(e))
          .toList(),
    );
  }
}
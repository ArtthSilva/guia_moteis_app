import 'package:guia_moteis_app/domain/entities/suite_entity.dart';

class MotelEntity {
  final String name;
  final String logo;
  final String neighborhood;
  final double distance;
  final int favoriteCount;
  final List<SuiteEntity> suites;
  final int reviewCount;
  final double rating;

  MotelEntity({
    required this.name,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.favoriteCount,
    required this.suites,
    required this.reviewCount,
    required this.rating,
  });

  factory MotelEntity.fromJson(Map<String, dynamic> json) {
    return MotelEntity(
      name: json['fantasia'],
      logo: json['logo'],
      neighborhood: json['bairro'],
      distance: json['distancia'],
      favoriteCount: json['qtdFavoritos'],
      suites: (json['suites'] as List)
          .map((e) => SuiteEntity.fromJson(e))
          .toList(),
      reviewCount: json['qtdAvaliacoes'],
      rating: json['media'],
    );
  }
}

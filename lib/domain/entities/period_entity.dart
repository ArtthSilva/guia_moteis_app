import 'package:guia_moteis_app/domain/entities/discount_entity.dart';

class PeriodEntity {
  final String formattedTime;
  final String time;
  final double value;
  final double totalValue;
  final bool hasCourtesy;
  final DiscountEntity? discount;

  PeriodEntity({
    required this.formattedTime,
    required this.time,
    required this.value,
    required this.totalValue,
    required this.hasCourtesy,
    this.discount,
  });

  factory PeriodEntity.fromJson(Map<String, dynamic> json) {
    return PeriodEntity(
      formattedTime: json['tempoFormatado'],
      time: json['tempo'],
      value: json['valor'],
      totalValue: json['valorTotal'],
      hasCourtesy: json['temCortesia'],
      discount: json['desconto'] != null
          ? DiscountEntity.fromJson(json['desconto'])
          : null,
    );
  }
}
class DiscountEntity {
  final double discount;

  DiscountEntity({required this.discount});

  factory DiscountEntity.fromJson(Map<String, dynamic> json) {
    return DiscountEntity(discount: json['desconto']);
  }
}
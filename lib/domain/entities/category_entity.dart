class CategoryItemEntity {
  final String name;
  final String icon;

  CategoryItemEntity({required this.name, required this.icon});

  factory CategoryItemEntity.fromJson(Map<String, dynamic> json) {
    return CategoryItemEntity(
      name: json['nome'],
      icon: json['icone'],
    );
  }
}
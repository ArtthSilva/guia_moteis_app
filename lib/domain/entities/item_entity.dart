class ItemEntity {
  final String name;

  ItemEntity({required this.name});

  factory ItemEntity.fromJson(Map<String, dynamic> json) {
    return ItemEntity(name: json['nome']);
  }
}
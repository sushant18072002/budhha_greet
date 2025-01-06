@HiveType(typeId: 1)
class Author extends HiveObject {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final Map<String, String> name;

  @HiveField(2)
  final Map<String, String> info;

  Author({
    required this.uuid,
    required this.name,
    required this.info,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        uuid: json['uuid'],
        name: Map<String, String>.from(json['name']),
        info: Map<String, String>.from(json['info']),
      );
}


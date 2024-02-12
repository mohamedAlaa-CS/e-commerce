import 'package:hive/hive.dart';
part 'categort_entity.g.dart';

@HiveType(typeId: 0)
class CategoryEntity {
  @HiveField(0)
  final String imageUrl;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String Id;

  CategoryEntity({
    required this.imageUrl,
    required this.title,
    required this.Id,
  });
}

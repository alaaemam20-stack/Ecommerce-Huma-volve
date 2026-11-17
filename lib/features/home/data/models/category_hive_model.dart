import 'package:hive/hive.dart';
part 'category_hive_model.g.dart';



@HiveType(typeId: 0)
class CategoryHiveModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  CategoryHiveModel({
    this.id = 0,
    this.name = '',
  });
}
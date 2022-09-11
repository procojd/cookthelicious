import 'dart:core';

import 'package:hive/hive.dart';

part 'addrecipemodel.g.dart';

@HiveType(typeId: 0)
class Add extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? procedure;
  @HiveField(3)
  String? calories;
  @HiveField(4)
  String? imglink;
  @HiveField(5)
  String? ingredient;
  @HiveField(6)
  int? cookingtime;
  @HiveField(7)
  int? servings;

Add({
    this.title,
    this.description,
    this.procedure,
    this.cookingtime,
    this.servings,
    this.calories,
    this.imglink,
    this.ingredient,
  });

}

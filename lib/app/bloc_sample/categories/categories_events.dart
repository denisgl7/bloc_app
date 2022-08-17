import 'package:flutter/foundation.dart';
import 'package:bloc_cocktails_app/app/core/models.dart';

@immutable
class CategoriesEvent {}

class CategoriesFetched extends CategoriesEvent {}

class CategoriesCategorySelected extends CategoriesEvent {
  CategoriesCategorySelected(this.category);

  final CocktailCategory category;
}

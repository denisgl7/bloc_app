
import 'package:flutter/foundation.dart';
import 'package:bloc_cocktails_app/app/core/src/model/cocktail_category.dart';

@immutable
class CocktailsEvent {}

class CocktailsFetched extends CocktailsEvent {
  CocktailsFetched(this.category);

  final CocktailCategory category;

}

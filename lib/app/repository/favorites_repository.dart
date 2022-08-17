import 'package:bloc_cocktails_app/app/core/models.dart';

abstract class FavoritesRepository {
  Future<Iterable<CocktailDefinition>> fetchFavorites();

  Future addToFavorites(CocktailDefinition cocktailDefinition);

  Future removeFromFavorites(String id);
}

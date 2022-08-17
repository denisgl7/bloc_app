import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_cocktails_app/app/bloc_sample/favorites/favorites_cubit.dart';
import 'package:bloc_cocktails_app/app/core/models.dart';

// пример работы с watch и select
// Показать что виджет не перестраивается
class FavoritesButtonV2 extends StatelessWidget {
  const FavoritesButtonV2(
    this.cocktailDefinition, {
    Key? key,
  }) : super(key: key);

  final CocktailDefinition cocktailDefinition;

  @override
  Widget build(BuildContext context) {
    final isFavorites = context
        .watch<FavoritesCubit>()
        .state
        .isFavorites(cocktailDefinition.id);

    // final isFavorites = context.select<FavoritesCubit, bool>(
    //     (value) => value.state.isFavorites(cocktailDefinition.id));

    print('FavoritesButton builder: ${cocktailDefinition.id}');
    final cubit = BlocProvider.of<FavoritesCubit>(context);
    if (isFavorites) {
      return IconButton(
          onPressed: () {
            cubit.removeFromFavorites(cocktailDefinition.id);
          },
          icon: const Icon(Icons.favorite, color: Colors.red));
    }
    return IconButton(
        onPressed: () {
          cubit.addToFavorites(cocktailDefinition);
        },
        icon: const Icon(Icons.favorite_border));
  }
}

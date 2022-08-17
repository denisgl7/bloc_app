import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_cocktails_app/app/bloc_sample/favorites/favorites_cubit.dart';
import 'package:bloc_cocktails_app/app/core/models.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton(
    this.cocktailDefinition, {
    Key? key,
  }) : super(key: key);

  final CocktailDefinition cocktailDefinition;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      // buildWhen: (a, b) {
      //   return b.isFavorites(cocktailDefinition.id) !=
      //       a.isFavorites(cocktailDefinition.id);
      // },
      builder: (context, state) {
        print('FavoritesButton builder: ${cocktailDefinition.id}');
        final cubit = BlocProvider.of<FavoritesCubit>(context);
        if (state.isFavorites(cocktailDefinition.id)) {
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
      },
    );
  }
}

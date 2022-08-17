import 'dart:async';
import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_cocktails_app/app/bloc_sample/categories/categories_bloc.dart';
import 'package:bloc_cocktails_app/app/bloc_sample/categories/categories_states.dart';
import 'package:bloc_cocktails_app/app/bloc_sample/cocktails/cocktails_states.dart';
import 'package:bloc_cocktails_app/app/core/models.dart';
import 'package:bloc_cocktails_app/app/repository/cocktail_repository.dart';
import 'cocktails_events.dart';

class CocktailsBlocLib extends Bloc<CocktailsEvent, CocktailsState> {
  // Пример подписки одного блока на другой
  CocktailsBlocLib({
    required this.cocktailRepository,
    required this.categoriesBloc,
  }) : super(CocktailsState.initial()) {
    fetchData();
  }

  Future<StreamSubscription> fetchData() async {
    return categoriesBloc.stream.listen((state) async {
      if (state is CategoriesLoadSuccess && state.selectedCategory != null) {
        try {
          emit(CocktailsState.loading());
          final cocktails = await cocktailRepository
              .fetchCocktailsByCocktailCategory(state.selectedCategory!);
          emit(CocktailsState.success(
              cocktails: UnmodifiableListView(cocktails)));
        } catch (e) {
          print(e);
          emit(CocktailsState.failure(errorMessage: e.toString()));
        }
      }
    });
  }

  late StreamSubscription _categoriesSubscription;

  final CocktailRepository cocktailRepository;

  final CategoriesBloc categoriesBloc;

  @override
  Future<void> close() {
    _categoriesSubscription.cancel();
    return super.close();
  }
}

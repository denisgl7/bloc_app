import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_cocktails_app/app/bloc_sample/cocktails/cocktails_states.dart';
import 'package:bloc_cocktails_app/app/core/models.dart';
import 'package:bloc_cocktails_app/app/repository/cocktail_repository.dart';

class CocktailsCubit extends Cubit<CocktailsState> {
  CocktailsCubit(this.cocktailRepository) : super(CocktailsState.initial());

  final CocktailRepository cocktailRepository;

  Future<void> fetchCocktails(CocktailCategory category) async {
    emit(CocktailsState.loading());
    try {
      final cocktails =
          await cocktailRepository.fetchCocktailsByCocktailCategory(category);
      emit(CocktailsState.success(cocktails: cocktails));
    } catch (e) {
      print(e);
      emit(CocktailsState.failure(errorMessage: e.toString()));
    }
  }
}

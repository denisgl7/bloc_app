import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_cocktails_app/app/bloc_sample/categories/categories_events.dart';
import 'package:bloc_cocktails_app/app/bloc_sample/categories/categories_states.dart';
import 'package:bloc_cocktails_app/app/core/models.dart';
import 'package:rxdart/rxdart.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesFetched>((event, emit) => emit(CategoriesLoadSuccess(
        categories: UnmodifiableListView(CocktailCategory.values),
        selectedCategory: CocktailCategory.values.first)));
    on<CategoriesCategorySelected>((event, emit) {
      if (state is CategoriesLoadSuccess) {
        final dateState = state as CategoriesLoadSuccess;
        return emit(dateState.copyWith(selectedCategory: event.category));
      }
    });
  }

  @override
  void onEvent(CategoriesEvent event) {
    super.onEvent(event);
  }

  @override
  void onTransition(Transition<CategoriesEvent, CategoriesState> transition) {
    super.onTransition(transition);
  }

  @override
  Stream<CategoriesState> get stream =>
      super.stream.debounceTime(const Duration(milliseconds: 42));

// @override
  // Stream<Transition<CategoriesEvent, CategoriesState>> transformTransitions(
  //     Stream<Transition<CategoriesEvent, CategoriesState>> transitions) {
  //   return super.transformTransitions(transitions);
  // }

  EventTransformer<ActivityEvent> debounce<ActivityEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

// @override
// Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
//   if (event is CategoriesFetched) {
//     // yield CategoriesLoadInProgress();
//     // yield CategoriesLoadFailure('errorMessage');
//     yield CategoriesLoadSuccess(
//         categories: UnmodifiableListView(CocktailCategory.values),
//         selectedCategory: CocktailCategory.values.first);
//   } else if (event is CategoriesCategorySelected &&
//       state is CategoriesLoadSuccess) {
//     final dateState = state as CategoriesLoadSuccess;
//     yield dateState.copyWith(selectedCategory: event.category);
//   }
// }
}

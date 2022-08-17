import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bloc_cocktails_app/app/bloc_sample/cocktails/cocktails_bloc_lib.dart';
import 'package:bloc_cocktails_app/app/ui/style/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'app/bloc_sample/categories/categories_bloc.dart';
import 'app/bloc_sample/categories/categories_events.dart';
import 'app/bloc_sample/favorites/favorites_cubit.dart';
import 'app/core/src/repository/async_cocktail_repository.dart';
import 'app/ui/root_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    // blocObserver: AppBlocObserver(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AsyncCocktailRepository(),
        ),
        //Categories
        BlocProvider(
          create: (context) => CategoriesBloc()..add(CategoriesFetched()),
        ),
        BlocProvider(
          create: (context) => CocktailsBlocLib(
            cocktailRepository:
                RepositoryProvider.of<AsyncCocktailRepository>(context),
            categoriesBloc: BlocProvider.of<CategoriesBloc>(context),
          ),
        ),
        //Favorites
        BlocProvider(create: (context) => FavoritesCubit())
      ],
      child: MaterialApp(
        theme: mainThemeData,
        home: RootPage(),
      ),
    );
  }
}

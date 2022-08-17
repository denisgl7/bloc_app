import 'package:flutter/cupertino.dart';

import 'cocktail_grid_item.dart';

const cocktailsGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    childAspectRatio: CocktailGridItem.aspectRatio,
    crossAxisSpacing: 6,
    mainAxisSpacing: 6,
    crossAxisCount: 2);

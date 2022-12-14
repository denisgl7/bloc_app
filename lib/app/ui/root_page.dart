import 'package:flutter/material.dart';
import 'package:bloc_cocktails_app/app/ui/filter/filter_page.dart';

import 'favorites/favorites_page.dart';

class RootPage extends StatefulWidget {
  @override
  RootPageState createState() => RootPageState();
}

class RootPageState extends State<RootPage> {
  int currentIndex = 0;

  final _pages = [const CocktailsFilterScreen(), const FavoritesPage()];

  final _tabs = [
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
    const BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Избранное'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Т.к state хранится внутри bloc
      // то pages будет сохранять необходимые данные
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _tabs,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

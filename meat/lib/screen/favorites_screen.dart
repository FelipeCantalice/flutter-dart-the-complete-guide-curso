import 'package:flutter/material.dart';
import 'package:meet/provider/home_provider.dart';
import 'package:meet/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    var _favoriteMeals = Provider.of<HomeProvider>(context).getFavoritesMeals();

    return Scaffold(
      body: ListView.builder(
        itemCount: _favoriteMeals.length,
        itemBuilder: (ctx, i) {
          return MealItem(
            meal: _favoriteMeals.elementAt(i),
            removeItem: () {},
          );
        },
      ),
    );
  }
}

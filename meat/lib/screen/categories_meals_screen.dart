import 'package:flutter/material.dart';
import 'package:meet/models/meal.dart';
import 'package:meet/provider/home_provider.dart';
import 'package:meet/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? args;
  List<Meal> meals = [];

  @override
  Widget build(BuildContext context) {
    var idCategoria = ModalRoute.of(context)?.settings.arguments as String?;
    var provider = Provider.of<HomeProvider>(context, listen: false);
    var meals = provider.filtrarPorCategoria(idCategoria ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text('Pratos'),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, i) {
          return MealItem(
            meal: meals.elementAt(i),
            removeItem: () {},
          );
        },
      ),
    );
  }
}

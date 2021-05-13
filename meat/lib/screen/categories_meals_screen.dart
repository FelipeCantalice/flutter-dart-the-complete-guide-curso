import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meet/models/category.dart' as models;
import 'package:meet/models/meal.dart';
import 'package:meet/widgets/meal_item.dart';

import '../models/category_dumy.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Map<String, dynamic>? args;
  List<Meal>? meals;
  models.Category? category;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

      category = models.Category.fromMap(args!);

      meals = DUMMY_MEALS
          .where(
            (meal) => meal.categories.contains(category?.id),
          )
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void _removeItem(String mealId) {
      setState(() {
        meals?.removeWhere((meal) => meal.id == mealId);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args!['title'] ?? ' ',
        ),
      ),
      body: ListView.builder(
        itemCount: meals?.length,
        itemBuilder: (ctx, i) {
          return MealItem(
            meal: meals!.elementAt(i),
            removeItem: () {},
          );
        },
      ),
    );
  }
}

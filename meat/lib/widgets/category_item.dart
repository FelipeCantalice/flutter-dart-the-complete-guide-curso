import 'package:flutter/material.dart';

import 'package:meet/models/category.dart';

import '../screen/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _selectCategory() {
      Navigator.of(context).pushNamed(
        CategoryMealsScreen.routeName,
        arguments: category.id,
      );
    }

    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: _selectCategory,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

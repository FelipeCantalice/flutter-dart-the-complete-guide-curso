import 'package:flutter/material.dart';
import 'package:meet/widgets/category_item.dart';

import '../models/category_dumy.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (var category in DUMMY_CATEGORIES) ...{
            CategoryItem(
              category: category,
            )
          },
        ],
      ),
    );
  }
}

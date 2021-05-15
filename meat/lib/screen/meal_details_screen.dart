import 'package:flutter/material.dart';
import 'package:meet/provider/home_provider.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meals-details';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    if (mealId.isEmpty) Navigator.of(context).pop();

    var provider = Provider.of<HomeProvider>(context, listen: true);

    final selectedMeal = provider.avaliableMeals.firstWhere(
      (meal) => meal.id == mealId,
    );

    void _addToFavorites() {
      provider.addFavorite(mealId);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${selectedMeal.title}",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredientes"),
            buildContainer(
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, i) {
                  final ingredients = selectedMeal.ingredients[i];
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(ingredients),
                    ),
                  );
                },
              ),
            ),
            buildSectionTitle(context, "Passos"),
            buildContainer(
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, i) {
                  final steps = selectedMeal.steps[i];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${i + 1}'),
                        ),
                        title: Text(steps),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          provider.isFavorite(mealId) ? Icons.favorite : Icons.favorite_outline,
        ),
        onPressed: _addToFavorites,
      ),
    );
  }

  Container buildContainer({child}) {
    return Container(
        width: 300,
        height: 150,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }

  Container buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}

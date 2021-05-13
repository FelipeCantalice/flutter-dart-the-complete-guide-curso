import 'package:flutter/material.dart';

import 'package:meet/models/meal.dart';
import 'package:meet/screen/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeItem;

  const MealItem({
    Key? key,
    required this.meal,
    required this.removeItem,
  }) : super(key: key);

  String get complexityText {
    if (meal.complexity == Complexity.SIMPLE) return "Simples";
    if (meal.complexity == Complexity.HARD) return "Dificil";
    if (meal.complexity == Complexity.CHALLENGING) return "Desafiador";
    return "Desconhecido";
  }

  String get custoText {
    if (meal.affordability == Affordability.AFFORDABLE) return "Acessivel";
    if (meal.affordability == Affordability.PRICEY) return "Barato";
    if (meal.affordability == Affordability.LUXURIUS) return "Luxo";
    return "Desconhecido";
  }

  void _selectMeal(context) {
    Navigator.of(context)
        .pushNamed(
          MealDetailsScreen.routeName,
          arguments: meal.id,
        )
        .then((result) => {if (result != null) {}});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${meal.duration} minutos"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(custoText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

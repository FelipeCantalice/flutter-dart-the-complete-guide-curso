import 'package:flutter/material.dart';
import 'package:meet/provider/home_provider.dart';
import 'package:meet/screen/meal_details_screen.dart';
import 'package:meet/screen/tabs_screen.dart';
import 'package:provider/provider.dart';
import 'screen/categories_meals_screen.dart';
import 'screen/filtros_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromARGB(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline1: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => TabsWidget(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
          FiltrosScreen.routeName: (ctx) => FiltrosScreen(),
        },
      ),
    );
  }
}

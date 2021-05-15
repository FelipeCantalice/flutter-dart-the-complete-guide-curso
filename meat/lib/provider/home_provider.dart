import 'package:flutter/cupertino.dart';
import 'package:meet/models/category_dumy.dart';
import 'package:meet/models/meal.dart';
import 'package:meet/presentation/meals_filter_enum.dart';

class HomeProvider extends ChangeNotifier {
  Map<MealsType, bool> _filters = {
    MealsType.GLUTEN: false,
    MealsType.LACTOSE: false,
    MealsType.VEGAN: false,
    MealsType.VEGETARIAN: false,
  };

  List<Meal> _avaliableMeals = DUMMY_MEALS;
  List<String> _favoriteMeals = [];

  get filters => _filters;
  get avaliableMeals => _avaliableMeals;

  void buscarTodos() {
    _avaliableMeals = DUMMY_MEALS;
  }

  void addFavorite(String mealId) {
    if (_favoriteMeals.contains(mealId)) {
      _favoriteMeals.remove(mealId);
      notifyListeners();
      return;
    }
    _favoriteMeals.add(mealId);
    notifyListeners();
  }

  List<Meal> getFavoritesMeals() {
    return _avaliableMeals
        .where((meal) => _favoriteMeals.contains(meal.id))
        .toList();
  }

  List<Meal> filtrarPorCategoria(String categoriaId) {
    return _avaliableMeals
        .where((meal) => meal.categories.contains(categoriaId))
        .toList();
  }

  void removeFavorite(String mealId) {
    _favoriteMeals.remove(mealId);
    notifyListeners();
  }

  bool isFavorite(String mealId) {
    return _favoriteMeals.contains(mealId);
  }

  void setFilters(MealsType type, bool isActive) {
    _filters[type] = isActive;

    _avaliableMeals = DUMMY_MEALS.where((meal) {
      if (_filters[MealsType.GLUTEN]! && !meal.isGluten) {
        return false;
      }
      if (_filters[MealsType.LACTOSE]! && !meal.isLactose) {
        return false;
      }
      if (_filters[MealsType.VEGAN]! && !meal.isVegan) {
        return false;
      }
      if (_filters[MealsType.VEGETARIAN]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }
}

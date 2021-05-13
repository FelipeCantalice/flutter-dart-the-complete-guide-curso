import 'dart:convert';

import 'package:flutter/foundation.dart';

enum Complexity { SIMPLE, CHALLENGING, HARD }

enum Affordability { AFFORDABLE, PRICEY, LUXURIUS }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGluten;
  final bool isLactose;
  final bool isVegan;
  final bool isVegetarian;
  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGluten,
    required this.isLactose,
    required this.isVegan,
    required this.isVegetarian,
  });

  Meal copyWith({
    String? id,
    List<String>? categories,
    String? title,
    String? imageUrl,
    List<String>? ingredients,
    List<String>? steps,
    int? duration,
    Complexity? complexity,
    Affordability? affordability,
    bool? isGluten,
    bool? isLactose,
    bool? isVegan,
    bool? isVegetarian,
  }) {
    return Meal(
      id: id ?? this.id,
      categories: categories ?? this.categories,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      ingredients: ingredients ?? this.ingredients,
      steps: steps ?? this.steps,
      duration: duration ?? this.duration,
      complexity: complexity ?? this.complexity,
      affordability: affordability ?? this.affordability,
      isGluten: isGluten ?? this.isGluten,
      isLactose: isLactose ?? this.isLactose,
      isVegan: isVegan ?? this.isVegan,
      isVegetarian: isVegetarian ?? this.isVegetarian,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'steps': steps,
      'duration': duration,
      'complexity': complexity.index,
      'affordability': affordability.index,
      'isGluten': isGluten,
      'isLactose': isLactose,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      categories: List<String>.from(map['categories']),
      title: map['title'],
      imageUrl: map['imageUrl'],
      ingredients: List<String>.from(map['ingredients']),
      steps: List<String>.from(map['steps']),
      duration: map['duration'],
      complexity: Complexity.values.elementAt(map['complexity']),
      affordability: Affordability.values.elementAt(map['affordability']),
      isGluten: map['isGluten'],
      isLactose: map['isLactose'],
      isVegan: map['isVegan'],
      isVegetarian: map['isVegetarian'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Meal(id: $id, categories: $categories, title: $title, imageUrl: $imageUrl, ingredients: $ingredients, steps: $steps, duration: $duration, complexity: $complexity, affordability: $affordability, isGluten: $isGluten, isLactose: $isLactose, isVegan: $isVegan, isVegetarian: $isVegetarian)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Meal &&
        other.id == id &&
        listEquals(other.categories, categories) &&
        other.title == title &&
        other.imageUrl == imageUrl &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.steps, steps) &&
        other.duration == duration &&
        other.complexity == complexity &&
        other.affordability == affordability &&
        other.isGluten == isGluten &&
        other.isLactose == isLactose &&
        other.isVegan == isVegan &&
        other.isVegetarian == isVegetarian;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categories.hashCode ^
        title.hashCode ^
        imageUrl.hashCode ^
        ingredients.hashCode ^
        steps.hashCode ^
        duration.hashCode ^
        complexity.hashCode ^
        affordability.hashCode ^
        isGluten.hashCode ^
        isLactose.hashCode ^
        isVegan.hashCode ^
        isVegetarian.hashCode;
  }
}

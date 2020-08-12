import 'package:flutter/material.dart';
import 'package:flutterMeats/components/meals-item.dart';
import 'package:flutterMeats/models/category.dart';
import 'package:flutterMeats/models/meal.dart';

class CategorieMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  CategorieMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealsItem(categoryMeals[index]);
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterMeats/components/meals-item.dart';
import 'package:flutterMeats/data/damy_data.dart';
import 'package:flutterMeats/models/category.dart';

class CategorieMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where((meal) {
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

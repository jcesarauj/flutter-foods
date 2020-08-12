import 'package:flutter/material.dart';
import 'package:flutterMeats/models/meal.dart';

class FavoritieScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritieScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Minhas comidas favoritas"));
  }
}

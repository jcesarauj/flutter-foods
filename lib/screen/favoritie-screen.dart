import 'package:flutter/material.dart';
import 'package:flutterMeats/components/meals-item.dart';
import 'package:flutterMeats/models/meal.dart';

class FavoritieScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritieScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(child: Text("Sorry! Vc não tem favoritos"));
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (ctx, index) {
            return MealsItem(favoriteMeals[index]);
          });
    }
  }
}

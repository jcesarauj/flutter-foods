import 'package:flutter/material.dart';
import 'package:flutterMeats/models/category.dart';

class CategorieMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text("Receitas por categorias"),
      ),
    );
  }
}

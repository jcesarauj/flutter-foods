import 'package:flutter/material.dart';
import 'package:flutterMeats/data/damy_data.dart';
import 'package:flutterMeats/models/meal.dart';
import 'package:flutterMeats/models/settings.dart';
import 'package:flutterMeats/screen/categories-meals-screen.dart';
import 'package:flutterMeats/screen/meals-detail-screen.dart';
import 'package:flutterMeats/screen/settings-screen.dart';
import 'screen/tabs-screen.dart';
import 'utils/app-routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings _settings = new Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      _settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORY_MEALS: (ctx) =>
            CategorieMealsScreen(_availableMeals),
        AppRoutes.MEALS_DETAIL: (ctx) => MealsDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_settings, _filterMeals)
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}

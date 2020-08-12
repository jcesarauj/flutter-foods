import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterMeats/components/main-drawer.dart';
import 'package:flutterMeats/models/meal.dart';
import 'package:flutterMeats/screen/categories-screen.dart';
import 'favoritie-screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  List<Map<String, Object>> _screen;

  @override
  void initState() {
    super.initState();
    _screen = [
      {'title': 'Lista de Categorias', 'screen': CategoryScreen()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoritieScreen(widget.favoriteMeals)
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screen[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screen[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categorias"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            title: Text("Favoritos"),
          )
        ],
      ),
    );
  }
}

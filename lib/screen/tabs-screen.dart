import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterMeats/screen/categories-screen.dart';

import 'favoritie-screen.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Vamos cozinhar?"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categorias",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favoritos",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryScreen(),
            FavoritieScreen(),
          ],
        ),
      ),
    );
  }
}

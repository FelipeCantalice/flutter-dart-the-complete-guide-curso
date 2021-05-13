import 'package:flutter/material.dart';
import 'package:meet/screen/categories_screen.dart';
import 'favorites_screen.dart';

class TabsWidget extends StatefulWidget {
  TabsWidget({Key? key}) : super(key: key);

  @override
  _TabsWidgetState createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  List<Map<String, dynamic>> _pages = [
    {
      "title": "Categorias",
      "screen": CategoriesScreen(),
      "actions": [],
    },
    {
      "title": "Favoritos",
      "screen": FavoritesScreen(),
      "actions": [
        Icon(Icons.person),
      ]
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]["title"]),
          actions: _pages[_selectedPageIndex]["actions"],
        ),
        body: _pages[_selectedPageIndex]['screen'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categorias",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favoritos",
            ),
          ],
        ),
      ),
    );
  }
}

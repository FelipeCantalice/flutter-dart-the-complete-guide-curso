import 'package:flutter/material.dart';
import 'package:meet/screen/categories_screen.dart';
import 'package:meet/widgets/main_drawer.dart';
import 'favorites_screen.dart';

class TabsWidget extends StatefulWidget {
  TabsWidget({Key? key}) : super(key: key);

  @override
  _TabsWidgetState createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen(),
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
          title: Text("Refeições"),
        ),
        drawer: MainDrawerWidget(),
        body: _pages[_selectedPageIndex],
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

import 'package:flutter/material.dart';
import 'package:meet/screen/filtros_screen.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          padding: const EdgeInsets.all(12.0),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            "Cooking up!!",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 20),
                _drawerItem(
                  title: "Meals",
                  icon: Icons.restaurant,
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                      '/',
                    );
                  },
                ),
                _drawerItem(
                  title: "Filtros",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                      FiltrosScreen.routeName,
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  ListTile _drawerItem({title, icon, onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meet/widgets/main_drawer.dart';

class FiltrosScreen extends StatefulWidget {
  static const routeName = '/filtros';

  @override
  _FiltrosScreenState createState() => _FiltrosScreenState();
}

class _FiltrosScreenState extends State<FiltrosScreen> {
  bool _isGlutenFree = false;
  bool _isVegetarianFree = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtros"),
      ),
      drawer: MainDrawerWidget(),
      body: Column(
        children: [
          Container(
            child: Text(
              'Ajuste a seleção',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Livre de gluten",
                  _isGlutenFree,
                  (val) {
                    setState(() {
                      _isGlutenFree = val;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Livre de lactose",
                  _isLactoseFree,
                  (val) {
                    setState(() {
                      _isLactoseFree = val;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegatarioano",
                  _isVegetarianFree,
                  (val) {
                    setState(() {
                      _isVegetarianFree = val;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegano",
                  _isVegan,
                  (val) {
                    setState(() {
                      _isVegan = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile _buildSwitchListTile(
      String title, bool currentValue, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text("Livre de gluten"),
      value: currentValue,
      onChanged: onChanged,
    );
  }
}

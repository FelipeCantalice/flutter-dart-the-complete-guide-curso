import 'package:flutter/material.dart';
import 'package:meet/presentation/meals_filter_enum.dart';
import 'package:meet/provider/home_provider.dart';
import 'package:meet/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class FiltrosScreen extends StatefulWidget {
  static const routeName = '/filtros';

  @override
  _FiltrosScreenState createState() => _FiltrosScreenState();
}

class _FiltrosScreenState extends State<FiltrosScreen> {
  Function(MealsType type, bool isActive)? filter;

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context, listen: true);

    Map<MealsType, bool> filters = homeProvider.filters;

    filter = homeProvider.setFilters;

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
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Livre de gluten",
                  filters[MealsType.GLUTEN] ?? false,
                  (val) {
                    filter?.call(MealsType.GLUTEN, val);
                  },
                ),
                _buildSwitchListTile(
                  "Livre de lactose",
                  filters[MealsType.LACTOSE] ?? false,
                  (val) {
                    filter?.call(MealsType.LACTOSE, val);
                  },
                ),
                _buildSwitchListTile(
                  "Vegetariano",
                  filters[MealsType.VEGETARIAN] ?? false,
                  (val) {
                    filter?.call(MealsType.VEGETARIAN, val);
                  },
                ),
                _buildSwitchListTile(
                  "Vegano",
                  filters[MealsType.VEGAN] ?? false,
                  (val) {
                    filter?.call(MealsType.VEGAN, val);
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
    String title,
    bool currentValue,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: onChanged,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test_app/third_app/drawer/main.drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.setFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;

  void _onSubmit() {
    widget.setFilters({
      'isGlutenFree': isGlutenFree,
      'isLactoseFree': isLactoseFree,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
    });

    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isGlutenFree = widget.filters['isGlutenFree'];
      isLactoseFree = widget.filters['isLactoseFree'];
      isVegan = widget.filters['isVegan'];
      isVegetarian = widget.filters['isVegetarian'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _onSubmit,
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text('Gruten-free'),
                  value: isGlutenFree,
                  subtitle: Text('Only include gluten-free meals.'),
                  onChanged: (bool newValue) {
                    setState(() {
                      isGlutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-free'),
                  value: isLactoseFree,
                  subtitle: Text('Only include lactose-free meals.'),
                  onChanged: (bool newValue) {
                    setState(() {
                      isLactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  value: isVegan,
                  subtitle: Text('Only include vegan meals.'),
                  onChanged: (bool newValue) {
                    setState(() {
                      isVegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian'),
                  value: isVegetarian,
                  subtitle: Text('Only include vegetarian meals.'),
                  onChanged: (bool newValue) {
                    setState(() {
                      isVegetarian = newValue;
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
}

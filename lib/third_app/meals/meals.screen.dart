import 'package:flutter/material.dart';

import 'package:flutter_test_app/third_app/meals/meal.item.dart';
import 'package:flutter_test_app/third_app/meals/meal.model.dart';
import '../categories/category.model.dart';

class MealsScreen extends StatefulWidget {
  static const routeName = '/meals';

  final List<Meal> avaiableMeals;

  MealsScreen(this.avaiableMeals);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  List<Meal> _meals;
  String _title;
  bool _loaded = false;

  void _removeMeal(String id) {
    setState(() {
      print(id);
      _meals.removeWhere((item) => (item.id == id));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Category;
      _title = routeArgs.title;
      _meals = widget.avaiableMeals.where((meal) {
        return meal.categories.contains(routeArgs.id);
      }).toList();
      _loaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(_meals[index], _removeMeal);
          },
          itemCount: _meals.length,
        ),
      ),
    );
  }
}

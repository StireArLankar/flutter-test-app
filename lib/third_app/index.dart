import 'package:flutter/material.dart';
import 'package:flutter_test_app/third_app/dummy-data.dart';
import 'package:flutter_test_app/third_app/filters/filters.screen.dart';
import 'package:flutter_test_app/third_app/meals/meal.model.dart';
import 'package:flutter_test_app/third_app/tabs/tabs.screen.dart';

import './meals/meals.screen.dart';
import './categories/categories.screen.dart';
import './meal/meal.screen.dart';

class ThirdApp extends StatefulWidget {
  @override
  _ThirdAppState createState() => _ThirdAppState();
}

class _ThirdAppState extends State<ThirdApp> {
  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegan': false,
    'isVegetarian': false,
  };

  List<Meal> _avaiableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;

      _avaiableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        } else if (_filters['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        } else if (_filters['isVegan'] && !meal.isVegan) {
          return false;
        } else if (_filters['isVegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
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
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        MealsScreen.routeName: (ctx) => MealsScreen(_avaiableMeals),
        MealScreen.routeName: (ctx) => MealScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters)
      },
      // onGenerateRoute: (settings) {
      //   print(settings);
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      onUnknownRoute: (settings) {
        print(settings);
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
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
        child: Text('Navigation Time!'),
      ),
    );
  }
}

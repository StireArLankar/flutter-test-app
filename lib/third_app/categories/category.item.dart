import 'package:flutter/material.dart';

import '../meals/meals.screen.dart';
import './category.model.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryItem(
      {@required this.title, @required this.color, @required this.id});

  void selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => MealsScreen(id, title),
    //   ),
    // );

    Navigator.of(context).pushNamed(
      MealsScreen.routeName,
      arguments: Category(id: id, color: color, title: title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(title, style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

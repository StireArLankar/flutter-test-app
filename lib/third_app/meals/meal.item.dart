import 'package:flutter/material.dart';

import '../meal/meal.screen.dart';
import './meal.model.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeItem;

  const MealItem(this.meal, this.removeItem);

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealScreen.routeName,
      arguments: meal,
    )
        .then((res) {
      if (res != null) {
        removeItem(res);
      }
    });
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RowText(icon: Icons.schedule, text: '${meal.duration} min'),
                  RowText(icon: Icons.work, text: complexityText),
                  RowText(icon: Icons.attach_money, text: affordabilityText),
                ],
              ),
              padding: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}

class RowText extends StatelessWidget {
  const RowText({
    Key key,
    @required this.text,
    @required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}

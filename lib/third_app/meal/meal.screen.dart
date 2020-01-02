import 'package:flutter/material.dart';
// import 'package:flutter_test_app/third_app/dummy-data.dart';
import 'package:flutter_test_app/third_app/meals/meal.model.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meal';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  // Widget buildScrollableList(
  //   Function(BuildContext, int) builderFn,
  //   int itemsCount,
  // ) {
  //   return Expanded(
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //       padding: const EdgeInsets.all(10),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         border: Border.all(color: Colors.grey),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: ListView.builder(
  //         itemBuilder: builderFn,
  //         itemCount: itemsCount,
  //       ),
  //     ),
  //   );
  // }

  Widget buildScrollableList(
    Function(BuildContext, int) builderFn,
    int itemsCount,
  ) {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        itemBuilder: builderFn,
        itemCount: itemsCount,
      ),
    );
  }

  Function(BuildContext, int) ingridientsBuilder(
    BuildContext context,
    Meal meal,
  ) {
    return (ctx, index) {
      return Card(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Text(meal.ingredients[index]),
        ),
      );
    };
  }

  Function(BuildContext, int) stepsBuilder(
    BuildContext context,
    Meal meal,
  ) {
    return (ctx, index) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(child: Text('# ${index + 1}')),
            title: Text(meal.steps[index]),
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
          ),
        ],
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    // final selectedMeal = DUMMY_MEALS.firstWhere((item) {
    //   return item.id === meal.id;
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 5),
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildScrollableList(
              ingridientsBuilder(context, meal),
              meal.ingredients.length,
            ),
            buildSectionTitle(context, 'Steps'),
            buildScrollableList(
              stepsBuilder(context, meal),
              meal.steps.length,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(meal.id);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './category.item.dart';
import '../dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';

  List<Widget> buildGrid() {
    return DUMMY_CATEGORIES
        .map(
          (item) => CategoryItem(
            title: item.title,
            color: item.color,
            id: item.id,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: buildGrid(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}

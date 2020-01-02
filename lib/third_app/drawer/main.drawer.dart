import 'package:flutter/material.dart';
import 'package:flutter_test_app/third_app/filters/filters.screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Cooking Yp!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 20),
          DrawerButton(
            icon: Icons.restaurant,
            title: 'Meals',
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          DrawerButton(
            icon: Icons.settings,
            title: 'Filters',
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                FiltersScreen.routeName,
              );
            },
          ),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const DrawerButton({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 26),
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

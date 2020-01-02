import 'package:flutter/material.dart';
import 'package:flutter_test_app/third_app/categories/categories.screen.dart';
import 'package:flutter_test_app/third_app/drawer/main.drawer.dart';
import 'package:flutter_test_app/third_app/favorites/favorites.screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  final List<String> _pagesTitles = [
    'Categories',
    'Favourites',
  ];

  int _selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget buildBottomTabs(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagesTitles[_selectedPageIndex]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }

  Widget buildDefaultTabs(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: 'Categories'),
              Tab(icon: Icon(Icons.star), text: 'Favourites'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildBottomTabs(context);
  }
}

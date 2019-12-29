import 'package:flutter/material.dart';

import './icon.dart';
import './quiz.dart';

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Icon Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Icon Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  iconSize: 50,
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () => _handleOnPressed(),
                ),
                CustomIcon(AnimatedIcons.play_pause),
                CustomIcon(AnimatedIcons.menu_arrow),
                CustomIcon(AnimatedIcons.ellipsis_search),
                CustomIcon(AnimatedIcons.menu_home),
                CustomIcon(AnimatedIcons.view_list),
                CustomIcon(AnimatedIcons.event_add),
                CustomIcon(AnimatedIcons.close_menu),
              ],
            ),
            Quiz()
          ],
        ),
      ),
    );
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}

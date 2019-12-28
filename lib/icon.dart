import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  CustomIcon(this.icon);
  final AnimatedIconData icon;

  @override
  _HomePageState createState() => _HomePageState(icon);
}

class _HomePageState extends State<CustomIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isPlaying = false;
  final AnimatedIconData icon;

  _HomePageState(this.icon);

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
    return IconButton(
      iconSize: 50,
      icon: AnimatedIcon(
        icon: icon,
        progress: _animationController,
      ),
      onPressed: () => _handleOnPressed(),
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

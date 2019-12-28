import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function onClick;

  Answer({this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2),
      child: RaisedButton(
        onPressed: onClick,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        // color: Colors.blue,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }
}

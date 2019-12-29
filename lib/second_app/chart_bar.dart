import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentage;

  ChartBar({this.label, this.amount, this.percentage});

  double get barHeight {
    if (percentage > 1) {
      return 1;
    } else if (percentage < 0) {
      return 0;
    }

    return percentage;
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Container(
            height: 20,
            child: FittedBox(
              child: Text('\$${amount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: barHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(label),
        ],
      );
}

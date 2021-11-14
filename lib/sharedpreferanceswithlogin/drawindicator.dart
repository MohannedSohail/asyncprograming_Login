import 'package:flutter/material.dart';

class DrawIndicators extends StatelessWidget {
  int repeatCount;
  int currentInx;

  DrawIndicators({required this.repeatCount, required this.currentInx});

  @override
  Widget build(BuildContext context) {
    List<Widget> _temp = [];
    for (int i = 0; i < repeatCount; i++) {
      _temp.add(new AnimatedContainer(
        width: currentInx == i ? 30 : 10,
        height: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color:
                currentInx == i ? Colors.blue : Colors.blue.withOpacity(0.4)),
        margin: EdgeInsets.symmetric(horizontal: 5),
        duration: Duration(milliseconds: 300),
      )); // and add our widget to the list
    }
    return new Row(
      children: _temp,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}

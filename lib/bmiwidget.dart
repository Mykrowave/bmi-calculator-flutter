import 'package:flutter/material.dart';

const Color defaultColor = Color(0xFF1D1E33);

class BMIWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  const BMIWidget({Key key, this.child, this.color = defaultColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}
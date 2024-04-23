import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  Color color;
  MyButton(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverColor: color,
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(name),
      focusColor: Colors.red,
    );
  }
}

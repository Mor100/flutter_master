import 'package:flutter/material.dart';

class name extends StatelessWidget {
  final Widget child;

  name({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
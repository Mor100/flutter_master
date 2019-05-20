import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final Widget child;

  NewsDetail({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
import 'package:flutter/material.dart';

class CustomRouter extends PageRouteBuilder {
  final Widget widget;

  CustomRouter(this.widget)
      : super(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation1, animation2) {
              return widget;
            },
            transitionsBuilder: (context, animation1, animation2, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0.09))
                    .animate(CurvedAnimation(
                        parent: animation1, curve: Curves.easeInOut)),
                child: child,
              );
            });
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget title;
  final Widget trailing;
  final Function onTab;
  final Color backgroundColor;

  CustomButton(
      {Key key, this.title, this.trailing, this.onTab, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: backgroundColor,
      child: InkWell(
        onTap: onTab,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[title, trailing],
          ),
        )
      ),
    );
  }
}

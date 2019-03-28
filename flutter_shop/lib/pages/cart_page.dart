import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/count.dart';
import 'package:provide/provide.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Number(),
              Button()
            ],
          ),
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<Count>(builder: (context,child,count){
        return Text('${count.value}');
      },)
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: (){
          Provide.value<Count>(context).increament();
        },
        child: Text('点击+1'),
      ),
    );
  }
}
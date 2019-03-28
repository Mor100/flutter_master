import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/count.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    
      child: Scaffold(
        body: Center(
          child: Provide<Count>(builder: (context,chile,count){
            return Text('${count.value}');
          },),
        ),
      ),
    );
  }
}
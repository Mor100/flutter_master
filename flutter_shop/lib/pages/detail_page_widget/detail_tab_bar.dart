import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/detail_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailTabBar extends StatelessWidget {
  final Widget child;

  DetailTabBar({Key key, this.child}) : super(key: key);

  Widget _leftBar(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        Provide.value<DetailProvide>(context).changeLeftRight(true);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(540),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1,color: isLeft?Colors.pink:Colors.white)
          ),
        ),
        child: Text('详细',style: TextStyle(color: isLeft?Colors.pink:Colors.black),),
      ),
    );
  }

  Widget _rightBar(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        Provide.value<DetailProvide>(context).changeLeftRight(false);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(540),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1,color: isLeft?Colors.pink:Colors.white)
          ),
        ),
        child: Text('详细',style: TextStyle(color: isLeft?Colors.pink:Colors.black),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<DetailProvide>(
      builder: (context,child,data){
        var isLeft = Provide.value<DetailProvide>(context).isLeft;
        var isRight = Provide.value<DetailProvide>(context).isRight;

        return Container(padding: EdgeInsets.only(top: 15),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              _leftBar(context, isLeft),
              _rightBar(context, isRight)
            ],)
          ],
        ),);
      },
    );
  }
}

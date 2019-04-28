import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:flutter_shop/model/cart_info.dart';



class CartCount extends StatelessWidget {
  CartInfoModel item;
  CartCount(this.item);

  Widget _reduceButton(BuildContext context) {
    return InkWell(
        onTap: () {
          Provide.value<CartProvide>(context).addOrReduceGoodsCount(item, 'reduce');
        },
        child: Container(
          alignment: Alignment.center,
          width: ScreenUtil().setWidth(45),
          height: ScreenUtil().setHeight(45),
          padding: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: item.count<=1?Colors.black12:Colors.white,
              border: Border(right: BorderSide(width: 1,color: Colors.black12))),
          child: Text(item.count>1?'-':''),
        ));
  }

  Widget _addButton(BuildContext context) {
    return InkWell(
        onTap: () {
          Provide.value<CartProvide>(context).addOrReduceGoodsCount(item, 'add');
        },
        child: Container(
          alignment: Alignment.center,
          width: ScreenUtil().setWidth(45),
          height: ScreenUtil().setHeight(45),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(left: BorderSide(width: 1,color: Colors.black12))),
          child: Text('+'),
        ));
  }

  Widget _countNum() {
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('${item.count}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(170),
      margin: EdgeInsets.only(top: 5),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        children: <Widget>[_reduceButton(context), _countNum(), _addButton(context)],
      ),
    );
  }
}

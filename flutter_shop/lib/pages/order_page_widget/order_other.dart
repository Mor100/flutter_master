import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OrderOther extends StatelessWidget {

  Widget _orderText(String text, double price) {
    return Container(
      margin: EdgeInsets.only(left:1,right: 1),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1,color: Colors.black12)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(text), Text('￥$price')],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double totalPrice = Provide.value<CartProvide>(context).totalPrice;

    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      // margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Column(
        children: <Widget>[
          _orderText('商品金额', totalPrice),
          _orderText('运费', 0),
          _orderText('实付总额', totalPrice)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderBottom extends StatelessWidget {
  const OrderBottom({Key key}) : super(key: key);

  Widget _totalPrice(double price) {
    return Container(
      child: Text('合计￥$price'),
    );
  }

  Widget _payFor() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(3)),
      child: InkWell(
        onTap: () {
          print('object');
        },
        child: Text('去付款'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = Provide.value<CartProvide>(context).totalPrice;
    return Container(
      width: ScreenUtil().setWidth(1080),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[_totalPrice(totalPrice), _payFor()],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/cart_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/cart_provide.dart';

class OrderItem extends StatelessWidget {
  final CartInfoModel model;

  const OrderItem({Key key, this.model}) : super(key: key);

  Widget _orderImage() {
    return Container(
      padding: EdgeInsets.all(3),
      width: ScreenUtil().setWidth(150),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Image.network(model.images),
    );
  }

  Widget _orderGoodsName() {
    return Container(
        width: ScreenUtil().setWidth(660),
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.topLeft,
        child: Text(model.goodsName));
  }

  Widget _orderGoodsPrice(BuildContext context, CartInfoModel item) {
    return Container(
      width: ScreenUtil().setWidth(200),
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[Text('￥${model.price}'), Text('X${model.count}')],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _orderImage(),
          _orderGoodsName(),
          _orderGoodsPrice(context, model)
        ],
      ),
    );
  }
}

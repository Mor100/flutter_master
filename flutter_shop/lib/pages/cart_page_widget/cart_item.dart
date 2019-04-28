import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_info.dart';
import 'cart_count.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:provide/provide.dart';

class CartItem extends StatelessWidget {
  final CartInfoModel model;
  const CartItem({Key key, this.model}) : super(key: key);

  Widget _cartCheckButton(BuildContext context) {
    return Container(
      child: Checkbox(
        value: model.isCheck,
        activeColor: Colors.pink,
        onChanged: (isCheck) {
          model.isCheck = isCheck;
          Provide.value<CartProvide>(context).checkState(model);
        },
      ),
    );
  }

  Widget _cartImage() {
    return Container(
      padding: EdgeInsets.all(3),
      width: ScreenUtil().setWidth(150),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Image.network(model.images),
    );
  }

  Widget _cartGoodsName() {
    return Container(
      width: ScreenUtil().setWidth(500),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text(model.goodsName), CartCount(model)],
      ),
    );
  }

  Widget _cartGoodsPrice(BuildContext context,CartInfoModel item) {
    return Container(
      width: ScreenUtil().setWidth(200),
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('￥${model.price}'),
          InkWell(
            onTap: () {
              Provide.value<CartProvide>(context).deleteGoods(item.goodsId);
            },
            child: Icon(
              Icons.delete_forever,
              color: Colors.black26,
              size: 30,
            ),
          )
        ],
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
        children: <Widget>[
          _cartCheckButton(context),
          _cartImage(),
          _cartGoodsName(),
          _cartGoodsPrice(context,model)
        ],
      ),
    );
  }
}

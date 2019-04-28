import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:flutter_shop/provide/detail_provide.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'package:flutter_shop/provide/current_index_provide.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsId =
        Provide.value<DetailProvide>(context).model.data.goodInfo.goodsId;
    var goodsName =
        Provide.value<DetailProvide>(context).model.data.goodInfo.goodsName;
    var count = 1;
    var price =
        Provide.value<DetailProvide>(context).model.data.goodInfo.presentPrice;
    var image =
        Provide.value<DetailProvide>(context).model.data.goodInfo.image1;
    return Container(
        child: Row(
      children: <Widget>[
        Stack(
          children: <Widget>[
            InkWell(
              onTap: () {
                Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(180),
                height: ScreenUtil().setHeight(120),
                child:
                    Icon(Icons.add_shopping_cart, size: 35, color: Colors.red),
              ),
            ),
            Provide<CartProvide>(builder: (context,child,_){
              int goodsCount = Provide.value<CartProvide>(context).totalCount;
              return Positioned(
                top: 0,
                right: 10,
                child: Container(
                  padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text('$goodsCount',style:TextStyle(color: Colors.white,fontSize:12)),
                ),);
            },)
          ],
        ),
        InkWell(
          onTap: () async {
            await Provide.value<CartProvide>(context)
                .save(goodsId, goodsName, count, price, image);
          },
          child: Container(
            width: ScreenUtil().setWidth(450),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.center,
            color: Colors.green,
            child: Text('加入购物车',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(30))),
          ),
        ),
        InkWell(
          onTap: () async {
            await Provide.value<CartProvide>(context).clear();
          },
          child: Container(
            width: ScreenUtil().setWidth(450),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.center,
            color: Colors.red,
            child: Text('马上购买',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(30))),
          ),
        ),
      ],
    ));
  }
}

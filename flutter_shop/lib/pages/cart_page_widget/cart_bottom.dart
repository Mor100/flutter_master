import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/cart_provide.dart';

class CartBottom extends StatelessWidget {
  Widget _selectAllButton(BuildContext context) {
    bool checkAll = Provide.value<CartProvide>(context).isCheckAll;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: checkAll,
            activeColor: Colors.pink,
            onChanged: (isCheck) {
              Provide.value<CartProvide>(context).checkAllStates(isCheck);
            },
          ),
          Text('全选')
        ],
      ),
    );
  }

  Widget _totalPrice(BuildContext context) {
    double totalPrice = Provide.value<CartProvide>(context).totalPrice;
    return Container(
      width: ScreenUtil().setWidth(550),
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: Text('合计',
                    style: TextStyle(fontSize: ScreenUtil().setSp(46))),
              ),
              Container(
                child: Text('￥$totalPrice',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(46), color: Colors.red)),
              )
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送，预购免配送',
              style: TextStyle(
                  color: Colors.black38, fontSize: ScreenUtil().setSp(36)),
            ),
          )
        ],
      ),
    );
  }

  Widget _payButton(BuildContext context) {
    int totalCount = Provide.value<CartProvide>(context).totalCount;
    return InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3)
          ),
          child: Text('结算($totalCount)',style:TextStyle(color:Colors.white)),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      color: Colors.white,
      width: ScreenUtil().setWidth(1080),
      child: Provide<CartProvide>(
        builder: (context,widget,provide){
          return Row(
        children: <Widget>[
          _selectAllButton(context),
          _totalPrice(context),
          _payButton(context)
        ],
      );
        },
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart_page_widget/cart_bottom.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'cart_page_widget/cart_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot) {
          List cartList = Provide.value<CartProvide>(context).cartInfoList;
          if (snapshot.hasData && cartList != null) {
            return Column(
              children: <Widget>[
                Provide<CartProvide>(
                  builder: (context, widget, provide) {
                    cartList = Provide.value<CartProvide>(context).cartInfoList;
                    return Expanded(child: Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cartList.length,
                          itemBuilder: (context, index) {
                            return CartItem(model: cartList[index]);
                          }),
                    ),);
                  },
                ),
                CartBottom(),
              ],
            );
          } else {
            return Text('数据加载中……');
          }
        },
      ),
    );
  }

  Future _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return '';
  }
}

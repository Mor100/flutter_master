import 'package:flutter/material.dart';
import 'order_page_widget/order_item.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/cart_provide.dart';
import 'order_page_widget/order_other.dart';
import 'order_page_widget/order_bottom.dart';


class OrderPage extends StatelessWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('确认订单'),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, shnapshot) {
          List cartList = Provide.value<CartProvide>(context).cartInfoList;
          if (shnapshot.hasData && cartList != null) {
            return Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Provide<CartProvide>(
                      builder: (context, widget, provide) {
                        cartList =
                            Provide.value<CartProvide>(context).cartInfoList;
                        return ListView.builder(
                          shrinkWrap: true,
                            itemCount: cartList.length,
                            itemBuilder: (context, index) {
                              return OrderItem(model: cartList[index]);
                            });
                      },
                    ),
                    OrderOther()
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: OrderBottom(),
                )
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

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  Widget _headImage() {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(20),
      color: Colors.pinkAccent,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 33),
            child: ClipOval(
              child: Image.network('http://lorempixel.com/80/80/'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'data',
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(46)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderType(Widget icon, String text) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Column(
        children: <Widget>[icon, Text(text)],
      ),
    );
  }

  Widget _orderArea() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      padding: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: _orderType(Icon(Icons.party_mode), '待付款'),
          ),
          Expanded(
            child: _orderType(Icon(Icons.query_builder), '待发货'),
          ),
          Expanded(
            child: _orderType(Icon(Icons.directions_car), '待收货'),
          ),
          Expanded(
            child: _orderType(Icon(Icons.content_paste), '待评价'),
          )
        ],
      ),
    );
  }

  Widget _myListTile(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: ListTile(
        title: Text(title),
        leading: Icon(Icons.blur_circular),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _actionListTile() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTile('领取优惠券'),
          _myListTile('已领取优惠券'),
          _myListTile('管理地址'),
          _myListTile('客服电话'),
          _myListTile('关于我们')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('会员中心'),
        ),
        body: ListView(
          children: <Widget>[_headImage(), _orderTitle(), _orderArea(),_actionListTile()],
        ));
  }
}

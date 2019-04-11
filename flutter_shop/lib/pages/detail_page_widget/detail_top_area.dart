import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/detail_provide.dart';

class DetailTopArea extends StatelessWidget {
  Widget _goodsImage(String src) {
    return Image.network(
      src,
      width: ScreenUtil().setWidth(1100),
    );
  }

  Widget _goodsName(String name) {
    return Container(
      padding: EdgeInsets.only(left: 15,top: 20),
      width: ScreenUtil().setWidth(730),
      child: Text(
        name,
        style: TextStyle(fontSize: ScreenUtil().setSp(50)),
        maxLines: 1,
      ),
    );
  }

  Widget _goodsNum(String num) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      width: ScreenUtil().setWidth(730),
      child: Text(
        '编号:$num',
        style: TextStyle(color: Colors.black38),
      ),
    );
  }

  Widget _goodsPrice(double price1,double price2){
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Text('￥$price1',style: TextStyle(color: Colors.pinkAccent,fontSize: ScreenUtil().setSp(45)),),
          SizedBox(width: ScreenUtil().setWidth(60)),
          Text('市场价:',style: TextStyle(color: Colors.black38),),
          SizedBox(width: ScreenUtil().setWidth(50),),
          Text('￥$price2',style: TextStyle(color: Colors.black12,decoration: TextDecoration.lineThrough),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<DetailProvide>(builder: (context,child,value){
      var goodsInfo = Provide.value<DetailProvide>(context).model.data.goodInfo;
      if(goodsInfo!=null){
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _goodsImage(goodsInfo.image1),
              _goodsName(goodsInfo.goodsName),
              _goodsNum(goodsInfo.goodsSerialNumber),
              _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice)
            ],
          ),
        );
      }else{
        return Center(child: Text('数据加载中'),);
      }
    },);
  }
}

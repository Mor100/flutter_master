import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/provide/detail_provide.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _goodsDetail =
        Provide.value<DetailProvide>(context).model.data.goodInfo.goodsDetail;
    print('HTML:$_goodsDetail');
    
    return Provide<DetailProvide>(builder: (context,child,data){
      var isLeft = Provide.value<DetailProvide>(context).isLeft;
      var isRight = Provide.value<DetailProvide>(context).isRight;
      if(isLeft){
        return Html(
          data: _goodsDetail,
        );
      }else{
        return Container(child: Text('暂时没有评论哦'),alignment: Alignment.center,width: ScreenUtil().setWidth(1100),height: ScreenUtil().setHeight(550),);
      }
    },);
    
  }
}

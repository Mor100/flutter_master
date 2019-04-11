import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailExplain extends StatelessWidget {
  final Widget child;

  DetailExplain({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      width: ScreenUtil().setWidth(1100),
      padding: EdgeInsets.all(10),
      child: Text('说明:>极速送达>正品保证',style: TextStyle(color: Colors.red,fontSize: ScreenUtil().setSp(40)),),
      
    );
  }
}
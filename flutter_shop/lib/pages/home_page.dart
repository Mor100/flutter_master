import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(height: 1776,width: 1080,allowFontScaling: true)..init(context);
    print("屏幕高度：${ScreenUtil.screenHeight}");
    print('屏幕宽度：${ScreenUtil.screenWidth}');
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('百姓生活+'),
          ),
          body: FutureBuilder(
            future: getHomePageContent(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                var mapList = (data['data']['recommend'] as List).cast();
                return Column(
                  children: <Widget>[
                    SwiperDiy(
                      swiperList: mapList,
                    )
                  ],
                );
              } else {
                return Center(
                  child: Text('加载中……',),
                );
              }
            },
          )),
    );
  }
}

class SwiperDiy extends StatelessWidget {
  final List swiperList;

  SwiperDiy({Key key, this.swiperList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(455),
      child: Swiper(
        itemCount: swiperList.length,
        itemBuilder: (context, index) => Image.network(
              '${swiperList[index]['image']}',
              fit: BoxFit.fill,
            ),
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

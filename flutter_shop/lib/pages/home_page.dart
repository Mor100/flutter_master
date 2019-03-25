import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  String homePageContent = '正在获取数据';
  int page = 1;
  List<Map> goodList = [];
  GlobalKey<RefreshFooterState> _footKey = GlobalKey<RefreshFooterState>();

  Widget _goodsItem(var src) => InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(1),
          padding: EdgeInsets.all(5),
          color: Colors.white,
          width: ScreenUtil().setWidth(500),
          child: Column(
            children: <Widget>[
              Image.network(
                src['image'],
                width: ScreenUtil().setWidth(300),
              ),
              Text(
                src['name'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
              ),
              Row(
                children: <Widget>[
                  Text('￥${src['mallPrice']}'),
                  Text('￥${src['price']}',
                      style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough))
                ],
              )
            ],
          ),
        ),
      );

  Widget _wrapList() {
    if (goodList.length != 0) {
      var widgets = goodList.map((value) {
        return _goodsItem(value);
      }).toList();
      return Wrap(
        spacing: 2,
        children: widgets,
      );
    } else {
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("屏幕高度：${ScreenUtil.screenHeight}");
    print('屏幕宽度：${ScreenUtil.screenWidth}');
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('百姓生活+'),
          ),
          body: FutureBuilder(
            future:
                request('homePageContent', data: {'lon': '120', 'lat': '30'}),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                var swiperList = (data['data']['slides'] as List).cast();
                var navigatorList = (data['data']['category'] as List).cast();
                var adBanner =
                    data['data']['advertesPicture']['PICTURE_ADDRESS'];
                var leaderImage = data['data']['shopInfo']['leaderImage'];
                var leaderPhone = data['data']['shopInfo']['leaderPhone'];
                var recommendList = (data['data']['recommend'] as List).cast();
                var floorTitle1 = data['data']['floor1Pic']['PICTURE_ADDRESS'];
                var floorTitle2 = data['data']['floor2Pic']['PICTURE_ADDRESS'];
                var floorTitle3 = data['data']['floor3Pic']['PICTURE_ADDRESS'];
                var floorList1 = (data['data']['floor1'] as List).cast();
                var floorList2 = (data['data']['floor2'] as List).cast();
                var floorList3 = (data['data']['floor3'] as List).cast();

                return EasyRefresh(
                  refreshFooter: ClassicsFooter(
                    key: _footKey,
                    loadText: '上拉加载更多',
                    loadingText: '正在加载中……',
                    noMoreText: '',
                    loadReadyText: '',
                    moreInfo: '',
                    loadedText: '加载完成',
                    bgColor: Colors.pink,
                    showMore: true,
                  ),
                  loadMore: () async {
                    request('homePageBelowConten', data: page).then((value) {
                      var data = json.decode(value.toString());
                      List<Map> newGoodList = (data['data'] as List).cast();
                      setState(() {
                        goodList.addAll(newGoodList);
                        page++;
                      });
                    });
                  },
                  child: ListView(
                    children: <Widget>[
                      SwiperDiy(
                        swiperList: swiperList,
                      ),
                      TopNaivgator(
                        navigatorList: navigatorList,
                      ),
                      ADBanner(
                        adBannerString: adBanner,
                      ),
                      LeaderInfo(
                        leaderImage: leaderImage,
                        leaderPhone: leaderPhone,
                      ),
                      Recommend(
                        recommendList: recommendList,
                      ),
                      FloorTitle(
                        picAdd: floorTitle1,
                      ),
                      Floor(
                        floorList: floorList1,
                      ),
                      FloorTitle(
                        picAdd: floorTitle2,
                      ),
                      Floor(
                        floorList: floorList2,
                      ),
                      FloorTitle(
                        picAdd: floorTitle3,
                      ),
                      Floor(
                        floorList: floorList3,
                      ),
                      Goods(),
                      _wrapList()
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    '数据加载中……',
                  ),
                );
              }
            },
          )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
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

class TopNaivgator extends StatelessWidget {
  final List navigatorList;

  TopNaivgator({Key key, this.navigatorList}) : super(key: key);

  Widget _getNavigatorItem(context, item) {
    return InkWell(
      onTap: () {
        print('发生了点击事件');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setHeight(95),
          ),
          Text(item['mallCategoryName'].toString())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      padding: EdgeInsets.all(3),
      child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          padding: EdgeInsets.all(5),
          children: navigatorList.map((item) {
            return _getNavigatorItem(context, item);
          }).toList()),
    );
  }
}

class ADBanner extends StatelessWidget {
  final String adBannerString;

  ADBanner({Key key, this.adBannerString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adBannerString),
    );
  }
}

class LeaderInfo extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;
  final MethodChannel chennel =
      MethodChannel('plugins.flutter.io/url_launcher');

  LeaderInfo({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  void _callPhone() async {
    String telURL = 'tel:' + leaderPhone;
    if (await canLaunch(telURL)) {
      await launch(telURL);
    } else {
      throw '无法打开URL';
    }
  }

  void _openURL() async {
    Map<String, String> phone = {'phone': leaderPhone};
    await chennel.invokeMethod('launch', phone);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Image.network(leaderImage),
        onTap: _openURL,
      ),
    );
  }
}

class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  Widget _title(String title) {
    return Container(
      child: Text(
        title,
        style: TextStyle(color: Colors.pink),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            color: Colors.black12,
            width: 0.5,
          ))),
    );
  }

  Widget _item(String src, double mallPrice, double price) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(360),
        width: ScreenUtil().setWidth(360),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(right: BorderSide(color: Colors.black12, width: 0.5))),
        child: Column(
          children: <Widget>[
            Image.network(src),
            Text('￥$mallPrice'),
            Text(
              '￥$price',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(485),
      child: ListView.builder(
        itemCount: recommendList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _item(recommendList[index]['image'],
              recommendList[index]['mallPrice'], recommendList[index]['price']);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ScreenUtil().setHeight(900),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[_title('商品推荐'), _recommendList()],
      ),
    );
  }
}

class FloorTitle extends StatelessWidget {
  final String picAdd;

  FloorTitle({Key key, this.picAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Image.network(picAdd),
      color: Colors.black12,
    );
  }
}

class Floor extends StatelessWidget {
  final List floorList;

  Floor({Key key, this.floorList}) : super(key: key);

  Widget _goodsItem(Map src) {
    return Container(
      width: ScreenUtil().setWidth(540),
      child: InkWell(
        onTap: () {
          print(src.toString());
        },
        child: Image.network(src['image']),
      ),
    );
  }

  Widget _firstRow() {
    return Container(
      child: Row(
        children: <Widget>[
          _goodsItem(floorList[0]),
          Column(
            children: <Widget>[
              _goodsItem(floorList[1]),
              _goodsItem(floorList[2]),
            ],
          )
        ],
      ),
    );
  }

  Widget _secondRow() {
    return Container(
      child: Row(
        children: <Widget>[
          _goodsItem(floorList[3]),
          _goodsItem(floorList[4]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_firstRow(), _secondRow()],
      ),
    );
  }
}

class Goods extends StatefulWidget {
  _GoodsState createState() => _GoodsState();
}

class _GoodsState extends State<Goods> {
  Widget _goodsTitle() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Text('火爆专区 '),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _goodsTitle());
  }
}

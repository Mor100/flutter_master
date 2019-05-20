import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_graduation/entity/news/data.dart';
import 'package:my_graduation/entity/news/news.dart';
import 'package:my_graduation/entity/news/result.dart';
import 'package:my_graduation/ui/layout.dart';
import 'package:flutter_refresh/flutter_refresh.dart';

class KejiNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _KejiNewsState();
  }
}

class _KejiNewsState extends State<KejiNews>
    with AutomaticKeepAliveClientMixin {
  var _url =
      'http://v.juhe.cn/toutiao/index?type=keji&key=c39989f9ba103c0cfea89eca5d6e0d55';
  var _client = HttpClient();
  var _dataList = <Data>[];
  var _listCount;

  void getDataByUrl() async {
    var request = await _client.getUrl(Uri.parse(_url));
    var response = await request.close();
    var json = await response.transform(utf8.decoder).join();

    Map newsMap = jsonDecode(json);
    var news = News.fromJson(newsMap);
    var result = Result.fromJson(news.result);
    setState(() {
      _dataList = result.data;
    });
  }

  Widget _listItem(BuildContext context, int index) {
    var data = _dataList[index];
    return CustomLayout.listItemLeftPic(data,context);
  }

  int _setListCount() => _listCount += 10;

  Future<Null> _onHeaderRefresh() async {
    await Future.delayed(
        Duration(seconds: 1),
        () => Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.lightBlueAccent[100],
              content: Text(
                '暂无更多数据',
                textAlign: TextAlign.center,
              ),
              duration: Duration(milliseconds: 500),
            )));
  }

  Future<Null> _onFooterRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      if (_listCount < _dataList.length) {
        setState(() {
          _setListCount();
        });
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(backgroundColor: Colors.lightBlueAccent[100],
          content: Text(
            '暂无跟多数据',
            textAlign: TextAlign.center,
          ),
          duration: Duration(milliseconds: 500),
        ));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listCount = 10;
    getDataByUrl();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Refresh(
      onHeaderRefresh: _onHeaderRefresh,
      onFooterRefresh: _onFooterRefresh,
      childBuilder: (context, {controller, physics}) {
        return Container(
          child: ListView.builder(
            itemBuilder: _listItem,
            itemCount: _dataList.length == 0 ? 0 : _listCount,
            controller: controller,
            physics: physics,
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'news/toutiao_news.dart';
import 'news/guonei_news.dart';
import 'news/guoji_news.dart';
import 'news/tiyu_news.dart';
import 'news/yule_news.dart';
import 'news/junshi_news.dart';
import 'news/caijing_news.dart';
import 'news/keji_news.dart';
import 'news/shehui_news.dart';
import 'news/shishang_news.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: NewsHomePage(),
    );
  }
}

class NewsHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsHomePageState();
  }
}

class _NewsHomePageState extends State<NewsHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('头条新闻'),
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: TabBar(
            labelColor: Colors.red,
            labelStyle: TextStyle(fontSize: 18),
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: TextStyle(fontSize: 15),
            indicatorWeight: 0.1,
            tabs: tabBarList,
            controller: _controller,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: tabBarViewList,
          controller: _controller,
        ),
      ),
    );
  }
}

var tabBarList = <Widget>[
  Tab(
    text: '头条',
  ),
  Tab(
    text: '国内',
  ),
  Tab(
    text: '国际',
  ),
  Tab(
    text: '体育',
  ),
  Tab(
    text: '娱乐',
  ),
  Tab(
    text: '军事',
  ),
  Tab(
    text: '财经',
  ),
  Tab(
    text: '科技',
  ),
  Tab(
    text: '社会',
  ),
  Tab(
    text: '时尚',
  ),
];

var tabBarViewList = <Widget>[
  ToutiaoNews(),
  GuoneiNews(),
  GuojiNews(),
  TiyuNews(),
  YuleNews(),
  JunshiNews(),
  CaijingNews(),
  KejiNews(),
  ShehuiNews(),
  ShishangNews(),
];

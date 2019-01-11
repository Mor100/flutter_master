import 'package:flutter/material.dart';
import 'video/chuangyi_video.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: VideoHomePage(),
    );
  }
}

class VideoHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VideoHomePageState();
  }
}

class _VideoHomePageState extends State<VideoHomePage> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 17, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('头条视频'),
      ),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: TabBar(
            tabs: tabBarList,
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: TextStyle(fontSize: 15),
            labelColor: Colors.red,
            labelStyle: TextStyle(fontSize: 18),
            indicatorWeight: 0.1,
            isScrollable: true,
            controller: _controller,
          ),
        ),
        body: TabBarView(children: tabBarViewList,controller: _controller,),
      ),
    );
  }
}

var tabBarList = <Widget>[
  Tab(
    text: '创意',
  ),
  Tab(
    text: '广告',
  ),
  Tab(
    text: '生活',
  ),
  Tab(
    text: '动画',
  ),
  Tab(
    text: '搞笑',
  ),
  Tab(
    text: '开胃',
  ),
  Tab(
    text: '运动',
  ),
  Tab(
    text: '音乐',
  ),
  Tab(
    text: '萌宠',
  ),
  Tab(
    text: '剧情',
  ),
  Tab(
    text: '科技',
  ),
  Tab(
    text: '旅行',
  ),
  Tab(
    text: '影视',
  ),
  Tab(
    text: '记录',
  ),
  Tab(
    text: '游戏',
  ),
  Tab(
    text: '综艺',
  ),
  Tab(
    text: '时尚',
  ),
];

var tabBarViewList = <Widget>[
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
  ChuangyiVideo(),
];

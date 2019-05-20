import 'package:flutter/material.dart';
import 'vews/my_page.dart';
import 'vews/news_page.dart';
import 'vews/video_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _pages;
  var _currentIndex;
  bool _visible;

  _setCurrentPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = <Widget>[NewsPage(context: context,), VideoPage(), MyPage(context)];
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            title: Text('视频'),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的'))
        ],
        onTap: _setCurrentPage,
        currentIndex: _currentIndex,
      ),
      body: _pages[_currentIndex],
    );
  }
}

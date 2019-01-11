import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_graduation/ui/custom_buttom.dart';
import 'package:my_graduation/ui/head_view.dart';
import 'package:my_graduation/ui/layout.dart';
import 'package:my_graduation/vews/login_page.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      color: Colors.blue,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String _userName;
  static const channel = const MethodChannel('flutter.io/dialog');

  Future<Null> _showNativeDialog() async {
    await channel.invokeMethod('showCustomDialog');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userName = '未登录';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.grey[100],
            margin: EdgeInsets.only(top: 250),
            child: Column(
              children: <Widget>[
                CustomButton(
                  title: Text(
                    '我的关注',
                    style: TextStyle(fontSize: 15),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTab: () {
                    if (_userName == '未登录') {
                      showCupertinoDialog(
                          context: context,
                          builder: (ctx) {
                            return CupertinoAlertDialog(
                              title: Text('您还未登录'),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                    },
                                    child: Text(
                                      '确定',
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent),
                                    )),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                    },
                                    child: Text(
                                      '取消',
                                      style: TextStyle(color: Colors.redAccent),
                                    ))
                              ],
                            );
                          });
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  trailing: Icon(Icons.keyboard_arrow_right),
                  title: Text('京东特供'),
                  onTab: () {},
                ),
                SizedBox(
                  height: 1,
                ),
                CustomButton(
                  title: Text('淘宝商城'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTab: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  title: Text('用户反馈'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTab: () {},
                ),
                SizedBox(
                  height: 1,
                ),
                CustomButton(
                  title: Text('检查版本'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTab: () {},
                )
              ],
            ),
          ),
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: Colors.blue,
              height: 300,
            ),
          ),
          Container(
              child: GestureDetector(
                child: CustomLayout.headPortrait(
                    'images/unlogined.png', _userName),
                onTap: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => LoginPage()));
                },
              ),
              margin: EdgeInsets.only(top: 50),
              alignment: Alignment.center),
        ],
      ),
    );
  }
}

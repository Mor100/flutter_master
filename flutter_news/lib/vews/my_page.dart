import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_graduation/ui/custom_buttom.dart';
import 'package:my_graduation/ui/head_view.dart';
import 'package:my_graduation/ui/layout.dart';
import 'package:my_graduation/vews/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPage extends StatefulWidget {
  BuildContext context;

  MyPage(this.context);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {
  String _userName;
  static const channel = const MethodChannel('flutter.io/dialog');

  Future<Null> _showNativeDialog() async {
    await channel.invokeMethod('showCustomDialog');
  }

  void _urlLauncher(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('无法打开网页');
    }
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
    return SingleChildScrollView(
      child: Stack(
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
                              title: Text('您还未登录,请先登录'),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                      Navigator.push(
                                          widget.context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
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
                  onTab: () {
                    _urlLauncher('https://m.jd.com');
                  },
                ),
                SizedBox(
                  height: 1,
                ),
                CustomButton(
                  title: Text('淘宝商城'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTab: () {
                    _urlLauncher('https://h5.m.taobao.com');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 1,
                ),
                CustomButton(
                  title: Text('检查版本'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTab: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.blueAccent,
                      content: Text('已是最新版本'),
                      duration: Duration(milliseconds: 800),
                    ));
                  },
                )
              ],
            ),
          ),
          ClipPath(
            clipper: BottomClipper(),
            child: Container(
              color: Colors.blue,
              height: 300,
              child: Container(
                  child: GestureDetector(
                    child: CustomLayout.headPortrait(
                        'images/unlogined.png', _userName),
                    onTap: () {
                      Navigator.push(
                          widget.context,
                          CupertinoPageRoute(
                              builder: (context) => LoginPage()));
                    },
                  ),
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.center),
            ),
          ),
        ],
      ),
    );
  }
}

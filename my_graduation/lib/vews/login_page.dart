import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: LoginHomePage());
  }
}

class LoginHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginHomePageState();
  }
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('用户登录'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person,
                size: 100,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.person_outline,
                      size: 28,
                    ),
                    margin: EdgeInsets.all(5),
                  ),
                  Expanded(
                      child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(hintText: '输入用户名'),
                  ))
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.vpn_key,
                      size: 28,
                    ),
                    margin: EdgeInsets.all(5),
                  ),
                  Expanded(
                      child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(hintText: '输入密码'),
                  )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text('注册账号'),
                  onTap: (){print('object');},
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                onPressed: () {},
                child: Container(
                  width: 250,
                  alignment: Alignment.center,
                  child: Text('登录'),
                ),
                color: Colors.blue,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.blue),
                ),
              )
            ],
          )),
    );
  }
}

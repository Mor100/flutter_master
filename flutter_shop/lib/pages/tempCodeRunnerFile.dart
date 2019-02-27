import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final String url = 'https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian';
  TextEditingController _editingController =TextEditingController();

  Future getHttp(String url,String text)async{
    var data = {'name':'包云云'};
    Response response = await Dio().get(url,queryParameters: data);
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: TextField(
         controller: _editingController,
         decoration: InputDecoration(
           
         ),
       ),
    );
  }

  Widget homePage(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('美好人间'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
        controller: _editingController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          labelText: '美女类型',
          helperText: '请输入你喜欢的类型'
        ),
      ),
        ],
      )
    );
  }
}
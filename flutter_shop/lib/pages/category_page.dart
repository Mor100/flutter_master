import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';
import '../model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:convert';

class CategoryPage extends StatefulWidget {
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text('商品分类')),
      body: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1,color: Colors.black12)
          )
        ),
        child: LeftNavigatorBar(),
      )
    ));
  }
}

class LeftNavigatorBar extends StatefulWidget {
  @override
  _LeftNavigatorBarState createState() => _LeftNavigatorBarState();
}

class _LeftNavigatorBarState extends State<LeftNavigatorBar> {
  List list = [];

  Widget _leftNavigatorItem(int index) {
    return InkWell(
      child: Container(
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(30)),
        ),
        padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      ),
      onTap: () {
        print(index);
      },
    );
  }

  void initState() {
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _leftNavigatorItem(index);
        },
      ),
    );
  }

  _getCategory() async {
    await request('getCategory').then((value) {
      var data = json.decode(value.toString());
      CategoryModel categoryModel = CategoryModel.fromJson(data);
      setState(() {
        list = categoryModel.data;
      });
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';
import '../model/category.dart';
import 'package:flutter_shop/model/category_goods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/category_provide.dart';

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
                child: Row(
              children: <Widget>[
                LeftNavigatorBar(),
                Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        RightCategoryDetails(),
                        Expanded(
                          child: CategoryGoodList(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ))));
  }
}

class LeftNavigatorBar extends StatefulWidget {
  @override
  _LeftNavigatorBarState createState() => _LeftNavigatorBarState();
}

class _LeftNavigatorBarState extends State<LeftNavigatorBar> {
  List _categoryList = [];
  List _list = [];
  var _index = 0;
  var categoryId;
  var categorySubId;
  int page;

  Widget _leftNavigatorItem(int index) {
    return InkWell(
      child: Container(
        child: Text(
          _categoryList[index].mallCategoryName,
          // style: TextStyle(fontSize: ScreenUtil().setSp(30)),
        ),
        padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
        decoration: BoxDecoration(
            color: _index != index ? Colors.white : Colors.black12,
            border: Border(
                top: BorderSide(width: 1, color: Colors.black12),
                right: BorderSide(width: 1, color: Colors.black12))),
      ),
      onTap: () {
        setState(() {
          _index = index;
          var id = _categoryList[index].mallCategoryId;
          categoryId = id;
          var categoryList = _categoryList[index].bxMallSubDto;
          Provide.value<CategoryChild>(context).getCategoryChild(categoryList);
          _getGoodList();
        });
      },
    );
  }

  void initState() {
    super.initState();
    categoryId = '4';
    categorySubId = '';
    page = 1;
    _getCategory();
          _getGoodList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(250),
      child: ListView.builder(
        itemCount: _categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return _leftNavigatorItem(index);
        },
      ),
    );
  }

  void _getCategory() async {
    await request('getCategory').then((value) {
      var data = json.decode(value.toString());
      CategoryModel categoryModel = CategoryModel.fromJson(data);
      setState(() {
        _categoryList = categoryModel.data;
      });
      Provide.value<CategoryChild>(context)
          .getCategoryChild(_categoryList[0].bxMallSubDto);
      // Provide.value<CategoryGoodListProvide>(context).getGoodList(_list);
      print(_categoryList[0].bxMallSubDto);
    });
  }

  void _getGoodList() async {
    await request('getMallGoods', data: {
      'categoryId': categoryId == null?'4':categoryId,
      'categorySubId': categorySubId,
      'page': page
    }).then((value) {
      var data = json.decode(value.toString());
      CategoryGoodsModel categoryGoods = CategoryGoodsModel.fromJson(data);
      setState(() {
        _list = categoryGoods.data;
      });
      Provide.value<CategoryGoodListProvide>(context).getGoodList(_list);
      print('商品分类:${_list[0].goodsName}');
    });
  }
}

class RightCategoryDetails extends StatefulWidget {
  @override
  _RightCategoryDetailsState createState() => _RightCategoryDetailsState();
}

class _RightCategoryDetailsState extends State<RightCategoryDetails> {
  List _list = [];

  Widget _itemInkWell(BxMallSubDto item) {
    return InkWell(
      child: Container(
        child: Text(item.mallSubName),
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<CategoryChild>(
        builder: (context, child, categoryChild) {
          return Container(
            height: ScreenUtil().setHeight(120),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12))),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryChild.categoryChildList.length,
              itemBuilder: (BuildContext context, int index) {
                return _itemInkWell(categoryChild.categoryChildList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

class CategoryGoodList extends StatefulWidget {
  _CategoryGoodListState createState() => _CategoryGoodListState();
}

class _CategoryGoodListState extends State<CategoryGoodList> {
  Widget _goodsImage(List list, int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].image),
      margin: EdgeInsets.all(5),
    );
  }

  Widget _goodsName(List list, int index) {
    return Container(
      // width: ScreenUtil().setWidth(480),
      margin: EdgeInsets.all(5),
      child: Text(
        list[index].goodsName,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _goodsPrice(List list, int index) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Text(
            '价格￥${list[index].presentPrice}',
            style: TextStyle(fontSize: ScreenUtil().setSp(40)),
          ),
          Text(
            '￥${list[index].oriPrice}',
            style: TextStyle(
                color: Colors.grey,
                fontSize: ScreenUtil().setSp(30),
                decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }

  Widget _goodsItem(List list, int index) {
    return InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: Row(
            children: <Widget>[
              _goodsImage(list, index),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _goodsName(list, index),
                      _goodsPrice(list, index)
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodListProvide>(
      builder: (context, child, data) {
        print('数组长度:${data.goodList.length}');
        return Container(
          width: ScreenUtil().setWidth(1000),
          height: ScreenUtil().setHeight(1000),
          child: ListView.builder(
            itemCount: data.goodList.length,
            itemBuilder: (BuildContext context, int index) {
              return _goodsItem(data.goodList, index);
            },
          ),
        );
      },
    );
  }
}

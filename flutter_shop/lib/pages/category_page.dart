import 'package:flutter/material.dart';
import 'package:flutter_shop/application/application.dart';
import 'package:flutter_shop/service/service_method.dart';
import '../model/category.dart';
import 'package:flutter_shop/model/category_goods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/category_provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_shop/provide/category_provide.dart';
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
  List<CategoryListData> _list = [];
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
        });
        var categoryList = _categoryList[index].bxMallSubDto;
        Provide.value<CategoryChild>(context)
            .getCategoryChild(categoryList, categoryId);
        _getGoodList();
      },
    );
  }

  void initState() {
    super.initState();
    categoryId = '4';
    categorySubId = '';
    page = 1;
    _getCategory();
    // var categoryList = _categoryList[0].bxMallSubDto;
    // Provide.value<CategoryChild>(context)
    //     .getCategoryChild(categoryList, categoryId);
    _getGoodList();
    print('categoryId:$categoryId,categorySubId:$categorySubId,page:$page');
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
          .getCategoryChild(_categoryList[0].bxMallSubDto, '4');
      Provide.value<CategoryGoodListProvide>(context).getGoodList(_list);
      // print(_categoryList[0].bxMallSubDto);
    });
  }

  void _getGoodList() async {
    await request('getMallGoods', data: {
      'categoryId': categoryId == null ? '4' : categoryId,
      'categorySubId': '',
      'page': page
    }).then((value) {
      var data = json.decode(value.toString());
      CategoryGoodsModel categoryGoods = CategoryGoodsModel.fromJson(data);
      Provide.value<CategoryGoodListProvide>(context)
          .getGoodList(categoryGoods.data);
    });
  }
}

class RightCategoryDetails extends StatefulWidget {
  @override
  _RightCategoryDetailsState createState() => _RightCategoryDetailsState();
}

class _RightCategoryDetailsState extends State<RightCategoryDetails> {
  List<CategoryListData> _list = [];

  Widget _itemInkWell(BxMallSubDto item, int index) {
    return InkWell(
      child: Container(
        child: Text(
          item.mallSubName,
          style: TextStyle(
              color: index !=
                      Provide.value<CategoryChild>(context).categoryChildIndex
                  ? Colors.black
                  : Colors.pink),
        ),
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      ),
      onTap: () {
        Provide.value<CategoryChild>(context)
            .changeIndex(index, item.mallSubId);
        _getGoodList(item.mallSubId);
      },
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
                return _itemInkWell(
                    categoryChild.categoryChildList[index], index);
              },
            ),
          );
        },
      ),
    );
  }

  void _getGoodList(String categorySubId) async {
    await request('getMallGoods', data: {
      'categoryId': Provide.value<CategoryChild>(context).categoryChildId,
      'categorySubId': categorySubId,
      'page': 1
    }).then((value) {
      var data = json.decode(value.toString());
      CategoryGoodsModel categoryGoods = CategoryGoodsModel.fromJson(data);
      if (categoryGoods.data == null) {
        Provide.value<CategoryGoodListProvide>(context).getGoodList([]);
      } else {
        Provide.value<CategoryGoodListProvide>(context)
            .getGoodList(categoryGoods.data);
      }
    });
  }
}

class CategoryGoodList extends StatefulWidget {
  _CategoryGoodListState createState() => _CategoryGoodListState();
}

class _CategoryGoodListState extends State<CategoryGoodList> {
  List _list = [];
  GlobalKey<RefreshFooterState> _footKey = GlobalKey<RefreshFooterState>();
  ScrollController _controller = ScrollController()..addListener((){});

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
        onTap: () {
          // print('${list[index]}');
          Application.router.navigateTo(context, '/detail?id=${list[index].goodsId}');
        },
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
        try {
          if (Provide.value<CategoryChild>(context).categoryPage == 1) {
            _controller.jumpTo(0);
          }
        } catch (e) {
          print(e);
        }
        if (data.goodList.length > 0) {
          return Container(
              width: ScreenUtil().setWidth(1000),
              height: ScreenUtil().setHeight(1000),
              child: EasyRefresh(
                refreshFooter: ClassicsFooter(
                  key: _footKey,
                  bgColor: Colors.pink,
                  textColor: Colors.white,
                  moreInfo: '加载中……',
                  moreInfoColor: Colors.white,
                  showMore: true,
                  noMoreText:
                      Provide.value<CategoryChild>(context).categoryNoMoreText,
                  loadReadyText: '上拉加载数据',
                ),
                child: ListView.builder(
                  controller: _controller,
                  itemCount: data.goodList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _goodsItem(data.goodList, index);
                  },
                ),
                loadMore: () async {
                  _getMoreList();
                },
              ));
        } else {
          return Center(
            child: Text('暂无数据'),
          );
        }
      },
    );
  }

  void _getMoreList() {
    Provide.value<CategoryChild>(context).addPage();
    request('getMallGoods', data: {
      'categoryId': Provide.value<CategoryChild>(context).categoryChildId,
      'categorySubId': Provide.value<CategoryChild>(context).categorySubId,
      'page': Provide.value<CategoryChild>(context).categoryPage
    }).then((value) {
      var data = json.decode(value.toString());

      CategoryGoodsModel model = CategoryGoodsModel.fromJson(data);
      if (model.data == null) {
        Fluttertoast.showToast(
            msg: '没有数据了',
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.white,
            backgroundColor: Colors.pink,
            fontSize: 16);
        Provide.value<CategoryChild>(context).changeText('没有更多数据');
      } else {
        Provide.value<CategoryGoodListProvide>(context).getMoreList(model.data);
      }
    });
  }
}

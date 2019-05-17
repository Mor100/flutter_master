import 'package:flutter/material.dart';
import '../model/category.dart';
import '../model/category_goods.dart';

class CategoryChild with ChangeNotifier {
  List<BxMallSubDto> _list = [];
  int _index = 0;
  String _categoryId = '0';
  String _subId = '';
  int _page = 1;
  String _noMoreText = '';

  List<BxMallSubDto> get categoryChildList => _list;
  int get categoryChildIndex => _index;
  String get categoryChildId => _categoryId;
  String get categorySubId => _subId;
  int get categoryPage => _page;
  String get categoryNoMoreText => _noMoreText;

  void getCategoryChild(List<BxMallSubDto> list, String categoryId) {
    _page = 1;
    _noMoreText = '';
    _index = 0;
    _categoryId = categoryId;
    BxMallSubDto all = BxMallSubDto(
        mallCategoryId: '00', mallSubId: '', mallSubName: '全部', comments: null);
    _list = [all];
    _list.addAll(list);
    notifyListeners();
  }

  void changeIndex(int index, String subId) {
    _page = 1;
    _index = index;
    _subId = subId;
    _noMoreText = '';
    notifyListeners();
  }

  void navigator(int index) {
    _index = index;
    notifyListeners();
  }

  void changeText(String text) {
    _noMoreText = text;
    notifyListeners();
  }

  void addPage() {
    _page++;
  }
}

class CategoryGoodListProvide with ChangeNotifier {
  List<CategoryListData> _list = [];

  List<CategoryListData> get goodList => _list;

  void getGoodList(List<CategoryListData> list) {
    _list = list;
    notifyListeners();
  }

  void getMoreList(List<CategoryListData> list) {
    _list.addAll(list);
    notifyListeners();
  }
}

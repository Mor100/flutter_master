import 'package:flutter/material.dart';
import '../model/category.dart';
import '../model/category_goods.dart';

class CategoryChild with ChangeNotifier {
  List<BxMallSubDto> _list = [];
  int _index = 0;
  String _categoryId = '0';
  String _subId = '';

  List<BxMallSubDto> get categoryChildList => _list;
  int get categoryChildIndex => _index;
  String get categoryChildId => _categoryId;
  String get categorySubId => _subId;
  
  void getCategoryChild(List<BxMallSubDto> list,String categoryId){
    _categoryId =categoryId;
    BxMallSubDto all =BxMallSubDto(mallCategoryId: '00',mallSubId: '00',mallSubName: '全部',comments: null);
    _list =[all];
    _list.addAll(list);
    notifyListeners();
  }

  void changeIndex(int index,String subId){
    _index =index;
    _subId = subId;
    notifyListeners();
  }
}

class CategoryGoodListProvide with ChangeNotifier {
  List<CategoryListData> _list = [];

  List<CategoryListData> get goodList => _list;
  
  void getGoodList(List<CategoryListData> list){
    _list =list;
    notifyListeners();
  }
}
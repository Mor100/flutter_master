import 'package:flutter/material.dart';
import '../model/category.dart';
import '../model/category_goods.dart';

class CategoryChild with ChangeNotifier {
  List<BxMallSubDto> _list = [];

  List<BxMallSubDto> get categoryChildList => _list;

  void getCategoryChild(List<BxMallSubDto> list){
    BxMallSubDto all =BxMallSubDto(mallCategoryId: '00',mallSubId: '00',mallSubName: '全部');
    _list =[all];
    _list.addAll(list);
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
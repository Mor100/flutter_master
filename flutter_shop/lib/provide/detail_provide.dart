import 'package:flutter/material.dart';
import '../model/detail_info.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'dart:convert';

class DetailProvide with ChangeNotifier{
  DetailModel _model = null;

  DetailModel get model => _model;

  void getGoodsInfo(String id){
    request('getGoodDetailById',data: {'goodId':id}).then((value){
      var data = json.decode(value.toString());
      print(data);
      _model = DetailModel.fromJson(data);
      notifyListeners();
    });
  }
}
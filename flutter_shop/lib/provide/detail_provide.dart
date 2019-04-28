import 'package:flutter/material.dart';
import '../model/detail_info.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'dart:convert';

class DetailProvide with ChangeNotifier{
  DetailModel _model;
  bool _isLeft = true;
  bool _isRight = false;


  DetailModel get model => _model;
  bool get isLeft => _isLeft;
  bool get isRight => _isRight;

  void getGoodsInfo(String id)async{
    await request('getGoodDetailById',data: {'goodId':id}).then((value){
      var data = json.decode(value.toString());
      _model = DetailModel.fromJson(data);
      notifyListeners();
    });
  }

  void changeLeftRight(bool isLeft){
    if(isLeft){
      _isLeft = true;
      _isRight = false;
    }else{
      _isLeft = false;
      _isRight = true;
    }
    notifyListeners();
  }
}
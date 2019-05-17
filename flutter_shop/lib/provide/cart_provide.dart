import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_shop/model/cart_info.dart';


class CartProvide with ChangeNotifier {
  var _string = '[]';
  List<CartInfoModel> cartInfoList = [];
  double totalPrice = 0;
  int totalCount = 0;
  bool isCheckAll = false;

  void save(String goodsId, String goodsName, int count, double price,
      String image) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _string = sharedPreferences.getString('cartInfo');
    var temp = _string == null ? [] : json.decode(_string.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int i = 0;

    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        tempList[i]['count'] = item['count'] + 1;
        cartInfoList[i].count++;
        isHave = true;
      }
      if(item['isCheck']){
        totalPrice = totalPrice + cartInfoList[i].count*cartInfoList[i].price;
        // totalCount += cartInfoList[i].count;
      }
      i++;
    });

    if (!isHave) {
      Map<String,dynamic> temp = {
        'goodsId':goodsId,
        'goodsName':goodsName,
        'count':count,
        'price':price,
        'images':image,
        'isCheck':true
      };
      tempList.add(temp);
      cartInfoList.add(CartInfoModel.fromJson(temp)); 
      totalPrice = totalPrice + count * price;
      totalCount += count;
    }
    _string = json.encode(tempList).toString();
    print(_string);
    print(cartInfoList.toString());
    sharedPreferences.setString('cartInfo', _string);
    notifyListeners();
  }

  void clear()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('cartInfo');
    notifyListeners();
  }

  void getCartInfo()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _string = sharedPreferences.getString('cartInfo');
    cartInfoList = [];
    if(_string!=null){
      List<Map> tempList = (json.decode(_string.toString()) as List).cast();
      totalCount = 0;
      totalPrice = 0;
      isCheckAll = true;
      tempList.forEach((item){
        if(item['isCheck']){
          totalCount += item['count'];
          totalPrice = item['count']*item['price']+totalPrice;
        }else{
          isCheckAll = false;
        }
        cartInfoList.add(CartInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  void deleteGoods(String goodsId)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _string = preferences.getString('cartInfo');
    List<Map> tempList = (json.decode(_string) as List).cast();
    int index = 0;
    int deleteIndex = 0;
    tempList.forEach((item){
      if(item['goodsId']==goodsId){
        deleteIndex = index;
      }
      index++;
    });

    tempList.removeAt(deleteIndex);
    _string = json.encode(tempList).toString();
    preferences.setString('cartInfo', _string);
    await getCartInfo();
  }

  void checkState(CartInfoModel model)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _string = sharedPreferences.getString('cartInfo');
    List<Map> tempList = (json.decode(_string) as List).cast();
    int index = 0;
    int changeIndex = 0;
    tempList.forEach((item){
      if(item['goodsId']==model.goodsId){
        changeIndex = index;
      }
      index++;
    });
    tempList[changeIndex] = model.toJson();
    _string = json.encode(tempList).toString();
    sharedPreferences.setString('cartInfo', _string);
    getCartInfo();
  }

  void checkAllStates(bool isCheck)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _string = preferences.getString('cartInfo');
    List<Map> tempList = (json.decode(_string) as List).cast();
    List<Map> list = [];
    for (var item in tempList) {
      var _ = item;
      _['isCheck'] = isCheck;
      list.add(_);
    }

    _string = json.encode(list);
    preferences.setString('cartInfo', _string);
    getCartInfo();
  }

  void addOrReduceGoodsCount(CartInfoModel goods,String toDo)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _string = preferences.getString('cartInfo');
    List<Map> tempList = (json.decode(_string) as List).cast();
    int index = 0;
    int changeIndex = 0;
    tempList.forEach((item){
      if(item['goodsId']==goods.goodsId){
        changeIndex = index;
      }
      index++;
    });
    if(toDo == 'add'){
      goods.count++;
    }else if(goods.count>1){
      goods.count--;
    }
    tempList[changeIndex] = goods.toJson();
    _string = json.encode(tempList);
    preferences.setString('cartInfo', _string);
    await getCartInfo();
  }
}

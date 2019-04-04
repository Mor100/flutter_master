import 'package:flutter/material.dart';
import '../provide/detail_provide.dart';
import 'package:provide/provide.dart';


class DetailPage extends StatelessWidget {
  String id;

  DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    _getInfo(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),),
        title: Text('商品详情'),
      ),
      body: FutureBuilder(
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Container(child: Text(id),);
          }else{
            return Center(child: Text('加载中……'),);
          }
        },
        future: _getInfo(context),
      ),
    );
  }

  Future _getInfo(BuildContext context)async{
    await Provide.value<DetailProvide>(context).getGoodsInfo(id);
    
    return '';
  }
}
import 'package:flutter/material.dart';
import '../provide/detail_provide.dart';
import 'package:provide/provide.dart';
import 'detail_page_widget/detail_top_area.dart';
import 'detail_page_widget/detail_explain.dart';
import 'detail_page_widget/detail_tab_bar.dart';
import 'detail_page_widget/detail_web.dart';

class DetailPage extends StatelessWidget {
  String id;

  DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    _getInfo(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(id),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DetailTopArea(),
                    DetailExplain(),
                    DetailTabBar(),
                    DetailWeb()
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text('加载中……'),
            );
          }
        },
        future: _getInfo(context),
      ),
    );
  }

  Future _getInfo(BuildContext context) async {
    await Provide.value<DetailProvide>(context).getGoodsInfo(id);

    return '';
  }
}

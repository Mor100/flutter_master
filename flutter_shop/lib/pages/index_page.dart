import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../pages/home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';
import 'package:flutter_shop/provide/current_index_provide.dart';


class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(title: Text('首页'), icon: Icon(CupertinoIcons.home)),
    BottomNavigationBarItem(
        title: Text('分类'), icon: Icon(CupertinoIcons.search)),
    BottomNavigationBarItem(
        title: Text('购物车'), icon: Icon(CupertinoIcons.shopping_cart)),
    BottomNavigationBarItem(
        title: Text('会员中心'), icon: Icon(CupertinoIcons.profile_circled)),
  ];

  List<Widget> bodyTabs = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  // @override
  // void initState() {
  //   currentPage = bodyTabs[currentIndex];
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(height: 1776, width: 1080, allowFontScaling: true)
          ..init(context);

    return Provide<CurrentIndexProvide>(
      builder: (context, child, _) {
        int currentIndex =
            Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: bodyTabs,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: bottomTabs,
            currentIndex: currentIndex,
            onTap: (index) {
              // setState(() {
              //   currentIndex = index;
              //   currentPage = bodyTabs[currentIndex];
              // });
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            },
          ),
        );
      },
    );
  }
}

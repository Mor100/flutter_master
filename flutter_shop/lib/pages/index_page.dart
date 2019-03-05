import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int currentIndex = 0;
  Widget currentPage;

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

  @override
  void initState() {
    currentPage = bodyTabs[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(height: 1776, width: 1080, allowFontScaling: true)
          ..init(context);

    return Container(
        child: Scaffold(
      body: IndexedStack(index: currentIndex,children: bodyTabs,),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = bodyTabs[currentIndex];
          });
        },
      ),
    ));
  }
}

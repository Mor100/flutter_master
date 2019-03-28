import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'provide/count.dart';
import 'package:provide/provide.dart';
import 'provide/category_provide.dart';

void main() {
  var count = Count(0);
  var categoryChild = CategoryChild();
  var categoryGoods = CategoryGoodListProvide();
  var provider = Providers();
  provider
    ..provide(Provider<Count>.value(count))
    ..provide(Provider<CategoryChild>.value(categoryChild))
    ..provide(Provider<CategoryGoodListProvide>.value(categoryGoods));
  runApp(ProviderNode(
    child: MyApp(),
    providers: provider,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '百姓生活+',
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage()),
    );
  }
}

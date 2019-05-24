import 'package:flutter/material.dart';

import 'pages/index_page.dart';
import 'provide/count.dart';
import 'package:provide/provide.dart';
import 'provide/category_provide.dart';
import 'package:fluro/fluro.dart';
import 'application/application.dart';
import 'router/routers.dart';
import 'provide/detail_provide.dart';
import 'provide/cart_provide.dart';
import 'provide/current_index_provide.dart';


void main() {
  var categoryChild = CategoryChild();
  var categoryGoods = CategoryGoodListProvide();
  var detailProvide = DetailProvide();
  var cartProvide = CartProvide();
  var currentIndexProvide = CurrentIndexProvide();
  var provider = Providers();
  provider
    ..provide(Provider<CategoryChild>.value(categoryChild))
    ..provide(Provider<CategoryGoodListProvide>.value(categoryGoods))
    ..provide(Provider<DetailProvide>.value(detailProvide))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  runApp(ProviderNode(
    child: MyApp(),
    providers: provider,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routers.configRouter(router);
    Application.router = router;
    return Container(
      child: MaterialApp(
          onGenerateRoute: Application.router.generator,
          debugShowCheckedModeBanner: false,
          title: '百姓生活+',
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage()),
    );
  }
}

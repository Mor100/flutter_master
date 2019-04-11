import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../pages/detail_page.dart';

Handler routerHandler = Handler(handlerFunc: (context, params) {
  String goodsId = params['id'].first;
  print(goodsId);
  return DetailPage(goodsId);
});

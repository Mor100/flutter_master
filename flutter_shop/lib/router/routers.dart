import 'package:fluro/fluro.dart';

import 'router_handler.dart';

class Routers{
  static String root = '/';
  static String detailPage = '/detail';
  static void configRouter(Router router){
    router.notFoundHandler = Handler(
      handlerFunc: (context,params){
        print('errow!not found routers');
      }
    );
    router.define(detailPage,handler:routerHandler);
  }
}
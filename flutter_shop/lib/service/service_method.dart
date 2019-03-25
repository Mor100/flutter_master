import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_shop/config/service_url.dart';

Future getHomePageContent() async {
  Dio dio = Dio();
  dio.options.contentType =
      ContentType.parse('application/x-www-form-urlencoded');
  var formData = {'lon': '115.02932', 'lat': '35.76189'};
  Response response =
      await dio.post(servicePath['homePageContent'], data: formData);
  if (response.statusCode == 200) {
    return response.data;
  } else {
    throw Exception('后端接口异常');
  }
}

Future request(String url, {var data}) async {
  Dio dio = Dio();
  Response response;
  dio.options.contentType =
      ContentType.parse('application/x-www-form-urlencoded');
  if (data == null) {
    response = await dio.post(servicePath[url]);
  } else
    response = await dio.post(servicePath[url], data: data);
  if (response.statusCode == 200) {
    return response.data;
  } else {
    throw Exception('请求错误，请检查接口');
  }
}

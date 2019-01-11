import 'package:flutter/material.dart';
import 'package:my_graduation/ui/layout.dart';
import 'dart:io';
import 'dart:convert';
import 'package:my_graduation/entity/video/video.dart';
import 'package:my_graduation/entity/video/data2.dart';
import 'package:my_graduation/entity/video/data.dart';
import 'package:my_graduation/entity/video/content.dart';
import 'package:my_graduation/entity/video/result.dart';
import 'package:my_graduation/entity/video/cover.dart';
import 'package:my_graduation/entity/video/provider.dart';

class ChuangyiVideo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChuangyiVideo();
  }
}

class _ChuangyiVideo extends State<ChuangyiVideo> {
  var _url = 'https://api.apiopen.top/videoCategoryDetails?id=2';
  var _client = HttpClient();
  List<String> _playUrl = <String>[],
      _name = <String>[],
      _icon = <String>[],
      _feed = <String>[];

  void _getDataByUrl() async {
    var request = await _client.getUrl(Uri.parse(_url));
    var response = await request.close();
    var json = await response.transform(utf8.decoder).join();

    Map map = jsonDecode(json);
    var video = Video.fromJson(map);

    video.result.forEach((item) {
      var result = Result.fromJson(item);
      var data = Data.fromJson(result.data);
      var content = Content.fromJosn(data.content);
      var data2 = Data2.fromJson(content.data2);
      var provider = Provider.fromJson(data2.provider);
      var cover = Cover.fromJson(data2.cover);

      setState(() {
        _playUrl.add(data2.playUrl);
        _name.add(provider.name);
        _icon.add(provider.icon);
        _feed.add(cover.feed);
      });
    });
  }

  Widget _listItem(BuildContext context, int index) {
    return CustomLayout.videoListItem(
        _playUrl[index], _feed[index], _icon[index], _name[index]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataByUrl();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: _listItem,
      itemCount: _feed.length == 0 ? 0 : 10,
    );
  }
}

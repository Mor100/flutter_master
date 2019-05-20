import 'package:custom_chewie/custom_chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_graduation/entity/news/data.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:video_player/video_player.dart';
import '../vews/news_detail.dart';

class CustomLayout {
  static Future<Null> _openWebView(BuildContext context,String title,String url){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetail()));
  }

  static Widget listItemAllPic(Data data, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Slidable(
            child: ListTile(
              onTap: () {
              },
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.title,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Image.network(
                        data.pic,
                        height: 80,
                      )),
                      Expanded(
                          child: data.pic02 != null
                              ? Image.network(
                                  data.pic02,
                                  height: 80,
                                )
                              : Image.asset(
                                  'images/blank.jpeg',
                                  height: 80,
                                )),
                      Expanded(
                          child: data.pic03 != null
                              ? Image.network(
                                  data.pic03,
                                  height: 80,
                                )
                              : Image.asset(
                                  'images/blank.jpeg',
                                  height: 80,
                                )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        data.authorName,
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data.date,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            delegate: SlidableDrawerDelegate(),
            actions: <Widget>[
              Container(
                color: Colors.blueAccent,
                child: FlatButton(
                    onPressed: () {
                      print('delete');
                    },
                    child: Icon(
                      Icons.delete,
                      size: 40,
                      color: Colors.white,
                    )),
              ),
            ],
            secondaryActions: <Widget>[
              Container(
                child: FlatButton(
                  onPressed: () async{
                    await EsysFlutterShare.shareText(data.authorName, '选择分享的应用');
                  },
                  child: Icon(
                    Icons.share,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                color: Colors.purple,
              ),
              Container(
                color: Colors.orange,
                child: FlatButton(
                  onPressed: () {
                    print('favorite');
                  },
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }

  static Widget listItemLeftPic(Data data,BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            color: Colors.white,
            child: Slidable(
              child: ListTile(
                onTap: () {

                },
                leading: Image.network(
                  data.pic,
                  height: 80,
                ),
                title: Text(
                  data.title,
                  maxLines: 2,
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(data.authorName),
                      SizedBox(
                        width: 10,
                      ),
                      Text(data.date)
                    ],
                  ),
                ),
              ),
              delegate: SlidableDrawerDelegate(),
              actions: <Widget>[
                Container(
                  color: Colors.blueAccent,
                  child: FlatButton(
                      onPressed: () {
                        print('delete');
                      },
                      child: Icon(
                        Icons.delete,
                        size: 40,
                        color: Colors.white,
                      )),
                ),
              ],
              secondaryActions: <Widget>[
                Container(
                  child: FlatButton(
                    onPressed: () {
                      
                    },
                    child: Icon(
                      Icons.share,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.purple,
                ),
                Container(
                  color: Colors.orange,
                  child: FlatButton(
                    onPressed: () {
                      print('favorite');
                    },
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                )
              ],
            )),
        Divider(
          height: 1,
        )
      ],
    );
  }

  static Widget listItemRightPic(Data data,BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            color: Colors.white,
            child: Slidable(
              child: ListTile(
                onTap: () {},
                trailing: Image.network(
                  data.pic,
                  height: 80,
                ),
                title: Text(
                  data.title,
                  maxLines: 2,
                ),
                subtitle: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(data.authorName),
                      SizedBox(
                        width: 10,
                      ),
                      Text(data.date)
                    ],
                  ),
                ),
              ),
              delegate: SlidableDrawerDelegate(),
              actions: <Widget>[
                Container(
                  color: Colors.blueAccent,
                  child: FlatButton(
                      onPressed: () {
                        print('delete');
                      },
                      child: Icon(
                        Icons.delete,
                        size: 40,
                        color: Colors.white,
                      )),
                ),
              ],
              secondaryActions: <Widget>[
                Container(
                  child: FlatButton(
                    onPressed: () {
                     
                    },
                    child: Icon(
                      Icons.share,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.purple,
                ),
                Container(
                  color: Colors.orange,
                  child: FlatButton(
                    onPressed: () {
                      print('favorite');
                    },
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                )
              ],
            )),
        Divider(
          height: 1,
        )
      ],
    );
  }

  static videoListItem(String playUrl, String feed, String icon, String name) {
    return Column(
      children: <Widget>[
        Chewie(
          VideoPlayerController.network(playUrl),
          autoInitialize: true,
          placeholder: Image.network(feed),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: icon != ''
                        ? Image.network(icon)
                        : Image.asset(
                            'images/user.png',
                            color: Colors.white,
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(name),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        '关注',
                        style: TextStyle(color: Colors.red),
                      )),
                  IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
                ],
              ),
            ),
          ],
        ),
        Divider()
      ],
    );
  }

  static Widget headPortrait(String filePath, String userName) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 70,
          child: Image.asset(
            filePath,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            userName,
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}

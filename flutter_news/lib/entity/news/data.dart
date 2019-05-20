import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'author_name')
  String authorName;

  @JsonKey(name: 'thumbnail_pic_s')
  String pic;

  @JsonKey(name: 'thumbnail_pic_s02')
  String pic02;

  @JsonKey(name: 'thumbnail_pic_s03')
  String pic03;

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'url')
  String url;

  Data([this.pic, this.title, this.authorName, this.pic02, this.pic03,this.date,this.url]);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

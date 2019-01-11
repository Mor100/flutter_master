import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  dynamic result;

  News([this.result]);

  factory News.fromJson(Map<dynamic, dynamic> json) => _$NewsFromJson(json);

  Map<dynamic, dynamic> toJson() => _$NewsToJson(this);
}
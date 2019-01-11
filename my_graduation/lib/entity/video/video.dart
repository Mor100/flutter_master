import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  List<dynamic> result;

  Video([this.result]);

  factory Video.fromJson(Map<String,dynamic> json)=>_$VideoFromJson(json);

  Map<String,dynamic> toJosn()=>_$VideoToJson(this);
}
part 'content.g.dart';

class Content{
  dynamic data2;

  Content([this.data2]);

  factory Content.fromJosn(Map<String,dynamic> json)=>_$ContentFromJson(json);

  Map<String,dynamic> toJson()=>_$ContentToJson(this);
}

part 'data2.g.dart';

class Data2{
  String playUrl;

  dynamic cover;

  dynamic provider;

  Data2([this.playUrl,this.cover,this.provider]);

  factory Data2.fromJson(Map<String,dynamic> json)=>_$Data2FromJson(json);

  Map<String,dynamic> toJson()=>_$Data2ToJson(this);
  
}
part 'data.g.dart';

class Data {
  dynamic content;

  Data([this.content]);

  factory Data.fromJson(Map<String,dynamic> json)=>_$DataFromJson(json);

  Map<String,dynamic> toJson()=>_$DataToJson(this);
}
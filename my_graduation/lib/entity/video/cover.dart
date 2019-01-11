part 'cover.g.dart';

class Cover {
  String feed;

  Cover([this.feed]);

  factory Cover.fromJson(Map<String,dynamic> json)=>_$CoverFromJson(json);

  Map<String,dynamic> toJson()=>_$CoverToJson(this);
}

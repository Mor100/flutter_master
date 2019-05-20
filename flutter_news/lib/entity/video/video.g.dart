part of 'video.dart';

Video _$VideoFromJson(Map<String,dynamic> json){
  return Video(json['result']);
}

Map<String,dynamic> _$VideoToJson(Video instance)=>
    <String,dynamic>{'result':instance.result};
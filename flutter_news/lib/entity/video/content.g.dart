part of 'content.dart';

Content _$ContentFromJson(Map<String,dynamic> json){
  return Content(json['data']);
}

Map<String,dynamic> _$ContentToJson(Content instance)=>
    <String,dynamic>{"data":instance.data2};
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['thumbnail_pic_s'] as String,
      json['title'] as String,
      json['author_name'] as String,
      json['thumbnail_pic_s02'] as String,
      json['thumbnail_pic_s03'] as String,
      json['date'] as String,
      json['url'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'title': instance.title,
      'author_name': instance.authorName,
      'thumbnail_pic_s': instance.pic,
      'thumbnail_pic_s02': instance.pic02,
      'thumbnail_pic_s03': instance.pic03,
      'date': instance.date,
      'url':instance.date
    };

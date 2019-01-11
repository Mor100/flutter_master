part of 'data2.dart';

Data2 _$Data2FromJson(Map<String, dynamic> json) {
  return Data2(json['playUrl'] as String, json['cover'], json['provider']);
}

Map<String, dynamic> _$Data2ToJson(Data2 instance) => <String, dynamic>{
      'playUrl': instance.playUrl,
      'cover': instance.cover,
      'provider': instance.provider
    };

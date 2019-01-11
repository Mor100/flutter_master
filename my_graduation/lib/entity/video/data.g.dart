part of 'data.dart';

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['content']);
}

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'content': instance.content};

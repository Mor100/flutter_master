part of 'cover.dart';

Cover _$CoverFromJson(Map<String, dynamic> json) {
  return Cover(json['feed'] as String);
}

Map<String, dynamic> _$CoverToJson(Cover instance) =>
    <String, dynamic>{'feed': instance.feed};

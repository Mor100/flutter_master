part of 'provider.dart';

Provider _$ProviderFromJson(Map<String, dynamic> json) {
  return Provider(json['name'] as String, json['icon'] as String);
}

Map<String, dynamic> _$ProviderToJson(Provider instance) =>
    <String, dynamic>{'name': instance.name, 'icon': instance.icon};

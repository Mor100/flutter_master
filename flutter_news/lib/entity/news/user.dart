import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  dynamic data;

  User([this.data]);

  factory User.fromJson(Map<String, dynamic> json) =>_$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

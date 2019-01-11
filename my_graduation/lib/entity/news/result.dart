import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  List<Data> data;

  Result([this.data]);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

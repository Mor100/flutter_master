part of 'result.dart';

Result _$ResultFromJson(Map<String,dynamic> json){
  return Result(json['data']);
}

Map<String,dynamic> _$ResultToJson(Result instance){
  return <String,dynamic>{'data':instance.data};
}

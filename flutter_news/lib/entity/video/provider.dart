part 'provider.g.dart';

class Provider{
  String name;
  String icon;

  Provider([this.name,this.icon]);

  factory Provider.fromJson(Map<String,dynamic> json)=>_$ProviderFromJson(json);

  Map<String,dynamic> toJson()=>_$ProviderToJson(this);
}
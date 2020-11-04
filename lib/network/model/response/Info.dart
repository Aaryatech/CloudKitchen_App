import 'package:json_annotation/json_annotation.dart';
part 'Info.g.dart';

@JsonSerializable(nullable: true)
class Info {
 String message;
 bool error;

  Info({this.message, this.error});

   factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  
  Map<String, dynamic> toJson() => _$InfoToJson(this);

}
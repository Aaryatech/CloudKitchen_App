
import 'package:json_annotation/json_annotation.dart';
part 'dairymart.g.dart';

@JsonSerializable(nullable: true)
class DairyMartModel{

  final  String settingKey,settingValue1,settingValue2,exVarchar1,exVarchar2,exVarchar3;
  final  int settingId ,delStatus;

  DairyMartModel(this.settingKey, this.settingValue1, this.settingValue2, this.exVarchar1, this.exVarchar2, this.exVarchar3, this.settingId, this.delStatus);



  factory DairyMartModel.fromJson(Map<String, dynamic> json) => _$DairyMartModelFromJson(json);
  //
  //
  Map<String, dynamic> toJson() => _$DairyMartModelToJson(this);
}
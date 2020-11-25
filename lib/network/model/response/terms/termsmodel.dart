import 'package:json_annotation/json_annotation.dart';
part 'termsmodel.g.dart';


@JsonSerializable(nullable: true)
class TermsModel{

  final  String settingKey,settingValue1,settingValue2,exVarchar1,exVarchar2,exVarchar3;
  final  int delStatus,settingId;

  TermsModel(this.settingKey, this.settingValue1, this.settingValue2, this.exVarchar1, this.exVarchar2, this.exVarchar3, this.delStatus, this.settingId);

  factory TermsModel.fromJson(Map<String, dynamic> json) => _$TermsModelFromJson(json);
  Map<String, dynamic> toJson() => _$TermsModelToJson(this);

}
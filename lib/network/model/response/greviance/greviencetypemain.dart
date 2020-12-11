import 'package:json_annotation/json_annotation.dart';

import '../../httpresponce.dart';
part 'greviencetypemain.g.dart';

@JsonSerializable(nullable: true)
class GrievanceTypeListMain {
  final List<GrievanceType> grievanceList;
  final Info info;

  GrievanceTypeListMain(this.grievanceList,this.info);

  factory GrievanceTypeListMain.fromJson(Map<String, dynamic> json) => _$GrievanceTypeListMainFromJson(json);


  Map<String, dynamic> toJson() => _$GrievanceTypeListMainToJson(this);

}



@JsonSerializable(nullable: true)
class GrievanceType{
 final  int grievanceId,delStatus,isActive,exInt1,exInt2,grievenceTypeId;
 final String caption,description,exVar1,exVar2,exVar3;

  GrievanceType(this.grievanceId, this.grievenceTypeId,this.delStatus, this.isActive, this.exInt1, this.exInt2, this.caption, this.description, this.exVar1, this.exVar2, this.exVar3);

 factory GrievanceType.fromJson(Map<String, dynamic> json) => _$GrievanceTypeFromJson(json);


 Map<String, dynamic> toJson() => _$GrievanceTypeToJson(this);

}
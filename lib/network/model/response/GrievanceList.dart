import 'package:json_annotation/json_annotation.dart';
part 'GrievanceList.g.dart';

@JsonSerializable(nullable: true)
class GrievanceListMain {
 final List<GrievanceList> grievanceList;

  GrievanceListMain(this.grievanceList);

 factory GrievanceListMain.fromJson(Map<String, dynamic> json) => _$GrievanceListMainFromJson(json);


 Map<String, dynamic> toJson() => _$GrievanceListMainToJson(this);

}



@JsonSerializable(nullable: true)
class GrievanceList{

   int grieveId,orderId,grievenceTypeId,grievenceSubtypeId,currentStatus,insertById,extraInt1,extraInt2,platform; 
	 String remark,insertDateTime,grievenceTypeName,grievenceSubtypeName,date,extraVar1,extraVar2,grievencceNo,grvInstrustion,grvType,orderNo; 
	 

     GrievanceList({this.grieveId,
      this.orderId,
      this.grievenceTypeId,
      this.grievenceSubtypeId,
      this.remark,
      this.currentStatus,
      this.insertDateTime,
      this.insertById,
      this.grievenceTypeName,
      this.grievenceSubtypeName,
      this.date,
      this.extraInt1,
      this.extraInt2,
      this.extraVar1,
      this.extraVar2,
      this.platform,
      this.grievencceNo,
      this.grvInstrustion,
	    this.grvType,
	    this.orderNo});

   factory GrievanceList.fromJson(Map<String, dynamic> json) => _$GrievanceListFromJson(json);

  
  Map<String, dynamic> toJson() => _$GrievanceListToJson(this);

}
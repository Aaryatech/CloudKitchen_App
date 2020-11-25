
import 'package:cloud_kitchen/network/model/OrderGrievanceTrail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Grievance.g.dart';

@JsonSerializable(nullable: true)
class Grievance{
  int grieveId,orderId,grievenceTypeId,grievenceSubtypeId,currentStatus,insertById,extraInt1,extraInt2,platform;
  String remark,insertDateTime,grievenceTypeName,grievenceSubtypeName,date,extraVar1,extraVar2,grievencceNo,grvType,grvInstrustion,orderNo;
  OrderGrievanceTrail getGrievienceTailList;

  Grievance(
      {this.grieveId,
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
      this.orderNo,
      this.grvType,
      this.grvInstrustion,
      this.getGrievienceTailList});

      
   factory Grievance.fromJson(Map<String, dynamic> json) => _$GrievanceFromJson(json);

  
  Map<String, dynamic> toJson() => _$GrievanceToJson(this);
}
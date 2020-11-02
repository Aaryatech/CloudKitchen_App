import 'package:json_annotation/json_annotation.dart';
part 'AddGrievance.g.dart';

@JsonSerializable(nullable: false)
class AddGrievance{

  int grieveId,orderId,grievenceTypeId,grievenceSubtypeId,currentStatus,insertById,extraInt1,extraInt2,platform,walletAmt,frAffectAmt;
  String remark,insertDateTime,grievenceTypeName,grievenceSubtypeName,date,extraVar1,extraVar2,grievencceNo,orderGrievanceTrail;
  
  AddGrievance(
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
      this.walletAmt,
      this.frAffectAmt,
      this.orderGrievanceTrail});

        factory AddGrievance.fromJson(Map<String, dynamic> json) => _$AddGrievanceFromJson(json);

  
  Map<String, dynamic> toJson() => _$AddGrievanceToJson(this);
}
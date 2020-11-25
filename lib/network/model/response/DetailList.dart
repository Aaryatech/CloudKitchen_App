import 'package:json_annotation/json_annotation.dart';
part 'DetailList.g.dart';

@JsonSerializable(nullable: true)
class DetailList{

   int orderDetailId,orderId,itemId,delStatus,exInt1,exInt2,exInt3,exInt4;
  String hsnCode,remark,exVar1,exVar2,exVar3,exVar4,itemName;
  double cgstAmt,sgstAmt,qty,mrp,rate,taxableAmt,cgstPer,sgstPer,igstPer,igstAmt,discAmt,taxAmt,
      totalAmt,exFloat1,exFloat2,exFloat3,exFloat4;
  

  DetailList(
      {this.orderDetailId,
      this.orderId,
      this.itemId,
      this.hsnCode,
      this.qty,
      this.mrp,
      this.rate,
      this.taxableAmt,
      this.cgstPer,
      this.sgstPer,
      this.igstPer,
      this.cgstAmt,
      this.sgstAmt,
      this.igstAmt,
      this.discAmt,
      this.taxAmt,
      this.totalAmt,
      this.delStatus,
      this.remark,
      this.exInt1,
      this.exInt2,
      this.exInt3,
      this.exInt4,
      this.exVar1,
      this.exVar2,
      this.exVar3,
      this.exVar4,
      this.exFloat1,
      this.exFloat2,
      this.exFloat3,
      this.exFloat4,
      this.itemName});

      factory DetailList.fromJson(Map<String, dynamic> json) => _$DetailListFromJson(json);

  
  Map<String, dynamic> toJson() => _$DetailListToJson(this);

}
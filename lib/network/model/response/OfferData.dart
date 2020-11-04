

import 'package:json_annotation/json_annotation.dart';
part 'OfferData.g.dart';

@JsonSerializable(nullable: true)
class OfferData{
  
   int offerDetailId,offerId,offerSubType,primaryItemId,secondaryItemId,isActive,delStatus,exInt1,exInt2,exInt3,exInt4;
	 String primaryQty,discPer,offerLimit,couponCode,secondaryQty,exVar1,exVar2,exVar3,exVar4;
	 double exFloat1,exFloat2,exFloat3,exFloat4;
     
    
   
   OfferData({this.offerDetailId,this.offerId,this.offerSubType,this.primaryItemId,this.primaryQty,this.discPer,this.offerLimit,
   this.couponCode,this.secondaryItemId,this.secondaryQty,this.isActive,this.delStatus,this.exInt1,this.exInt2,this.exInt3,
   this.exInt4,this.exVar1,this.exVar2,this.exVar3,this.exVar4,this.exFloat1,this.exFloat2,this.exFloat3,this.exFloat4});
   
   
  factory OfferData.fromJson(Map<String, dynamic> json) => _$OfferDataFromJson(json);
   
     
     Map<String, dynamic> toJson() => _$OfferDataToJson(this);
   
  
   
   
}
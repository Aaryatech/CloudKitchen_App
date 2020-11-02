import 'package:cloud_kitchen/network/model/response/Images.dart';
import 'package:cloud_kitchen/network/model/response/OfferData.dart';
import 'package:json_annotation/json_annotation.dart';
part 'OfferList.g.dart';

@JsonSerializable(nullable: false)
class OfferList{

 int offerId,type,offerType,frequencyType,makerUserId,compId,isActive,delStatus,exInt1,exInt2,exInt3,exInt4;
	 String offerName,offerDesc,applicableFor,frequency,fromDate,toDate,fromTime,toTime,makerDatetime,exVar1,exVar2,
   lastUpdatedDatetime,exVar3,exVar4,exFloat1,exFloat2,exFloat3,exFloat4;
	 
	List<Images> imageList;
	List<OfferData> offerDetailList;

OfferList({ this.offerName,this.offerDesc,this.type,this.applicableFor,this.offerType,this.frequencyType,this.frequency,this.fromDate,this.toDate,this.fromTime,this.toTime,this.makerUserId,this.makerDatetime,this.lastUpdatedDatetime,this.compId,this.isActive,this.delStatus,this.exInt1,this.exInt2,this.exInt3,this.exInt4,this.exVar1,this.exVar2,this.exVar3,this.exVar4,this.exFloat1,this.exFloat2,this.exFloat3,this.exFloat4,this.imageList,this.offerDetailList});
 
 factory OfferList.fromJson(Map<String, dynamic> json) => _$OfferListFromJson(json);
   
     
     Map<String, dynamic> toJson() => _$OfferListToJson(this);

}
import 'package:cloud_kitchen/network/model/response/DetailList.dart';
import 'package:cloud_kitchen/network/model/response/TrailList.dart';
import 'package:json_annotation/json_annotation.dart';
part 'OrderHistory.g.dart';

@JsonSerializable(nullable: false)
class OrderHistory{

int orderId,frId,custId,status,taxableAmt,igstAmt,discAmt,itemDiscAmt,taxAmt,totalAmt,orderStatus,paidStatus,
paymentMethod,cityId,areaId,addressId,insertUserId,orderPlatform,delStatus,offerId,orderDeliveredBy,exInt1,exInt2,exInt3,
exInt4,exFloat1,exFloat2,exFloat3,exFloat4,deliveryType,deliveryInstId,deliveryCharges,paymentSubMode,isAgent;
  String orderNo,orderDate,paymentRemark,address,whatsappNo,landmark,deliveryDate,deliveryTime,insertDateTime,
  remark,exVar1,exVar2,exVar3,exVar4,exDate1,exDate2,billingName,billingAddress,customerGstnNo,deliveryInstText,areaName,
  cityName,custName,frName,uuidNo;
  double cgstAmt,sgstAmt,deliveryKm;
 
  List<DetailList> detailList;
  List<TrailList> trailList;
  String grievTrailList;
  String trailDetailList;
  String orderGriev;

  OrderHistory(
      {this.orderId,
      this.orderNo,
      this.orderDate,
      this.frId,
      this.custId,
      this.status,
      this.taxableAmt,
      this.cgstAmt,
      this.sgstAmt,
      this.igstAmt,
      this.discAmt,
      this.itemDiscAmt,
      this.taxAmt,
      this.totalAmt,
      this.orderStatus,
      this.paidStatus,
      this.paymentMethod,
      this.paymentRemark,
      this.cityId,
      this.areaId,
      this.addressId,
      this.address,
      this.whatsappNo,
      this.landmark,
      this.deliveryDate,
      this.deliveryTime,
      this.insertDateTime,
      this.insertUserId,
      this.orderPlatform,
      this.delStatus,
      this.offerId,
      this.remark,
      this.orderDeliveredBy,
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
      this.exDate1,
      this.exDate2,
      this.billingName,
      this.billingAddress,
      this.customerGstnNo,
      this.deliveryInstText,
      this.deliveryType,
      this.deliveryInstId,
      this.areaName,
      this.cityName,
      this.custName,
      this.frName,
      this.deliveryKm,
      this.deliveryCharges,
      this.paymentSubMode,
      this.isAgent,
      this.uuidNo,
      this.detailList,
      this.trailList,
      this.grievTrailList,
      this.trailDetailList,
      this.orderGriev});


  factory OrderHistory.fromJson(Map<String, dynamic> json) => _$OrderHistoryFromJson(json);
   
     
     Map<String, dynamic> toJson() => _$OrderHistoryToJson(this);

}
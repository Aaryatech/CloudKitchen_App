


import 'package:cloud_kitchen/network/model/httpresponce.dart';

import 'package:json_annotation/json_annotation.dart';
part 'placeordermain.g.dart';

@JsonSerializable(nullable: true)
class PlaceOrderModel{

 final String uuidNo;
 final double amt;
 final int orderId,payMode,paidStatus,orderStatus;
  final Info info;
  final PaymentResponse paymentResponse;
  PlaceOrderModel(this.orderId, this.uuidNo, this.amt, this.payMode, this.paidStatus, this.orderStatus, this.info,this.paymentResponse);
 factory PlaceOrderModel.fromJson(Map<String, dynamic> json) => _$PlaceOrderModelFromJson(json);
 Map<String, dynamic> toJson() => _$PlaceOrderModelToJson(this);
}



@JsonSerializable(nullable: true)
class PaymentResponse{
 final String status,message,cftoken;
  PaymentResponse(this.status, this.message, this.cftoken);
 factory PaymentResponse.fromJson(Map<String, dynamic> json) => _$PaymentResponseFromJson(json);
 Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);
}
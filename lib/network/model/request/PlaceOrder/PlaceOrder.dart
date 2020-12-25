
import 'package:cloud_kitchen/network/model/request/PlaceOrder/OrderDetailList.dart';
import 'package:cloud_kitchen/network/model/request/PlaceOrder/OrderTrail.dart';
import 'package:json_annotation/json_annotation.dart';
part 'PlaceOrder.g.dart';

@JsonSerializable(nullable: true)
class PlaceOrder{
  final int frId,custId,applicableFor,orderStatus,payMode,addressId,
      orderPlatform,offerId,wallet,deliveryType,deliveryInstructionId;
  final String deliveryDate,deliveryTime,deliveryInstructionText,gst;
  final double km,deliveryCharges,itemTotal,discAmt;
 final List<OrderDetailList> orderDetailParamList;

  PlaceOrder(
      {this.frId,
        this.gst,
      this.custId,
      this.applicableFor,
      this.orderStatus,
      this.payMode,
      this.addressId,
      this.orderPlatform,
      this.offerId,
      this.wallet,
      this.deliveryType,
      this.deliveryInstructionId,
      this.deliveryDate,
      this.deliveryTime,
      this.deliveryInstructionText,
      this.km,
      this.deliveryCharges,
      this.itemTotal,
      this.discAmt,
      this.orderDetailParamList});

  factory PlaceOrder.fromJson(Map<String, dynamic> json) => _$PlaceOrderFromJson(json);


  Map<String, dynamic> toJson() => _$PlaceOrderToJson(this);

}
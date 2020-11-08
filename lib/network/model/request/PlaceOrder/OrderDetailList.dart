import 'package:json_annotation/json_annotation.dart';
part 'OrderDetailList.g.dart';

@JsonSerializable(nullable: true)
class OrderDetailList{
  int itemId,qty;
  double selectedQty;

  OrderDetailList({this.itemId, this.selectedQty, this.qty});

  factory OrderDetailList.fromJson(Map<String, dynamic> json) => _$OrderDetailListFromJson(json);


  Map<String, dynamic> toJson() => _$OrderDetailListToJson(this);
}
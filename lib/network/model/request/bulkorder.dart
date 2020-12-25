
import 'package:json_annotation/json_annotation.dart';
part 'bulkorder.g.dart';

@JsonSerializable(nullable: true)
class BulkOrderModel{

final  String name,number,email,time,people,address;

  BulkOrderModel(
      {this.name,
      this.number,
      this.email,
      this.time,
      this.people,
      this.address});


  factory BulkOrderModel.fromJson(Map<String, dynamic> json) => _$BulkOrderModelFromJson(json);


  Map<String, dynamic> toJson() => _$BulkOrderModelToJson(this);
}
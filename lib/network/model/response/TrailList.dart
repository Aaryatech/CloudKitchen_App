import 'package:json_annotation/json_annotation.dart';
part 'TrailList.g.dart';

@JsonSerializable(nullable: false)
class TrailList{
  int trailId,orderId,actionByUserId,status,exInt1,exInt2,exInt3;
  String actionDateTime,exVar1,exVar2,exVar3,actionUserName;
  

  TrailList(
      {this.trailId,
      this.orderId,
      this.actionByUserId,
      this.actionDateTime,
      this.status,
      this.exInt1,
      this.exInt2,
      this.exInt3,
      this.exVar1,
      this.exVar2,
      this.exVar3,
      this.actionUserName});

  factory TrailList.fromJson(Map<String, dynamic> json) => _$TrailListFromJson(json);

  
  Map<String, dynamic> toJson() => _$TrailListToJson(this);
}
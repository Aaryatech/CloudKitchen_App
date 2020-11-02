import 'package:json_annotation/json_annotation.dart';
part 'AreaListByCityId.g.dart';

@JsonSerializable(nullable: false)
class AreaListByCityId{

  int areaId,cityId,companyId,delStatus,isActive,exInt1,exInt2;
  String description,areaName,areaCode,pincode,latitude,longitude,exVar1,exVar2;
  

  AreaListByCityId(
      {this.areaId,
      this.cityId,
      this.description,
      this.areaName,
      this.areaCode,
      this.pincode,
      this.companyId,
      this.delStatus,
      this.latitude,
      this.longitude,
      this.isActive,
      this.exInt1,
      this.exInt2,
      this.exVar1,
      this.exVar2});

      factory AreaListByCityId.fromJson(Map<String, dynamic> json) => _$AreaListByCityIdFromJson(json);

  
  Map<String, dynamic> toJson() => _$AreaListByCityIdToJson(this);
}
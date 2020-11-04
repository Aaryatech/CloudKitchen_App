
import 'package:json_annotation/json_annotation.dart';
part 'CustomerAddress.g.dart';

@JsonSerializable(nullable: true)
class CustomerAddress{

  int custAddressId,custId,areaId,cityId,delStatus,exInt1,exInt2,exInt3,exFloat1,exFloat2,exFloat3;
  String addressCaption,address,area,landmark,pincode,latitude,longitude,exVar1,exVar2,exVar3,areaName,cityName;
  

  CustomerAddress({this.custAddressId,
      this.custId,
      this.addressCaption,
      this.address,
      this.areaId,
      this.area,
      this.landmark,
      this.pincode,
      this.cityId,
      this.delStatus,
      this.latitude,
      this.longitude,
      this.exInt1,
      this.exInt2,
      this.exInt3,
      this.exVar1,
      this.exVar2,
      this.exVar3,
      this.exFloat1,
      this.exFloat2,
      this.exFloat3,
      this.areaName,
      this.cityName});

      factory CustomerAddress.fromJson(Map<String, dynamic> json) => _$CustomerAddressFromJson(json);

  
  Map<String, dynamic> toJson() => _$CustomerAddressToJson(this);
}
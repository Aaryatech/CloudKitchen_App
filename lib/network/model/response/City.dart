import 'package:json_annotation/json_annotation.dart';
part 'City.g.dart';

@JsonSerializable(nullable: false)
class City{

   int cityId,companyId,delStatus,isActive,exInt1,exInt2;
  String cityName,description,cityCode,exVar1,exVar2;
  

  City(
      {this.cityId,
      this.cityName,
      this.description,
      this.cityCode,
      this.companyId,
      this.delStatus,
      this.isActive,
      this.exInt1,
      this.exInt2,
      this.exVar1,
      this.exVar2});

      factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  
  Map<String, dynamic> toJson() => _$CityToJson(this);
}
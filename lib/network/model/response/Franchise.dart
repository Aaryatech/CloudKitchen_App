import 'package:cloud_kitchen/network/model/response/Info.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Franchise.g.dart';

@JsonSerializable(nullable: true)
class Frainchise {
 int frConfigId,frId,frType,compId;
 String frName,frCode,frAddress,frMob,fromLatitude,fromLongitude,toLatitude,toLongitude,cityList,areaList;
double kmAreaCovered;




 
 Frainchise(
      {this.frConfigId,
      this.frId,
      this.frType,
      this.frName,
      this.frCode,
      this.frAddress,
      this.frMob,
      this.fromLatitude,
      this.fromLongitude,
      this.toLatitude,
      this.toLongitude,
      this.kmAreaCovered,
      this.compId,
      this.cityList,
      this.areaList,
  });

        factory Frainchise.fromJson(Map<String, dynamic> json) => _$FrainchiseFromJson(json);

  
  Map<String, dynamic> toJson() => _$FrainchiseToJson(this);
}
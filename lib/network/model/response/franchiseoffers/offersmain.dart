
import 'package:cloud_kitchen/network/model/httpresponce.dart';
import 'package:cloud_kitchen/network/model/response/OfferList.dart';
import 'package:cloud_kitchen/network/model/response/custwallet/custwallet.dart';
import 'package:json_annotation/json_annotation.dart';
part 'offersmain.g.dart';

@JsonSerializable(nullable: true)
class OffersMain{
 final  Info info;
 final List<OfferList> offerList;
 final AdditionalCharges additionalCharges;
 final DeliveryCharges deliveryCharges;
 final CustWallet custWalletTotal;


 OffersMain(this.info,this.offerList,this.additionalCharges,this.deliveryCharges,this.custWalletTotal);
  factory OffersMain.fromJson(Map<String, dynamic> json) => _$OffersMainFromJson(json);
  Map<String, dynamic> toJson() => _$OffersMainToJson(this);
}




@JsonSerializable(nullable: true)
class AdditionalCharges{

 final  int chargeId,frId,exInt1,exInt2,ExInt3;
final  double surchargeFee,packingChg,handlingChg,extraChg,roundOffAmt,exFloat1,exFloat2,exFloat3;

  AdditionalCharges(this.chargeId, this.frId, this.exInt1, this.exInt2, this.ExInt3, this.surchargeFee, this.packingChg, this.handlingChg, this.extraChg, this.roundOffAmt, this.exFloat1, this.exFloat2, this.exFloat3);

 factory AdditionalCharges.fromJson(Map<String, dynamic> json) => _$AdditionalChargesFromJson(json);
 Map<String, dynamic> toJson() => _$AdditionalChargesToJson(this);


}

@JsonSerializable(nullable: true)
class DeliveryCharges{

 final  String id;
final  double amt1,amt2,minKm,maxKm,minAmt,freeDelvLimit;

 DeliveryCharges(this.id,this.amt1,this.amt2,this.minKm,this.maxKm,this.minAmt,this.freeDelvLimit);

 factory DeliveryCharges.fromJson(Map<String, dynamic> json) => _$DeliveryChargesFromJson(json);
 Map<String, dynamic> toJson() => _$DeliveryChargesToJson(this);


}
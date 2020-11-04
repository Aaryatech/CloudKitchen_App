import 'package:json_annotation/json_annotation.dart';
part 'MadhviCredit.g.dart';

@JsonSerializable(nullable: true)
class MadhviCredit{

   int walletId,orderId;
	 String orderNo,orderDate,totalAmt,amount,walletDate,transcType,billNo;
	 

   MadhviCredit({this.walletId,this.orderId,this.orderNo,this.totalAmt,this.amount,this.walletDate,this.transcType,this.billNo});

   factory MadhviCredit.fromJson(Map<String, dynamic> json) => _$MadhviCreditFromJson(json);

  
  Map<String, dynamic> toJson() => _$MadhviCreditToJson(this);

}
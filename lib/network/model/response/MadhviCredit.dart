import 'package:json_annotation/json_annotation.dart';
part 'MadhviCredit.g.dart';

@JsonSerializable(nullable: true)
class MadhviCredit{

   int walletId,orderId;
	 String orderNo,orderDate,walletDate,transcType,billNo;
	 double totalAmt,amount;

   MadhviCredit(
     {
       this.walletId,
       this.orderId,
       this.orderNo,
       this.totalAmt,
       this.amount,
       this.walletDate,
       this.transcType,
       this.billNo,
       this.orderDate
       });

   factory MadhviCredit.fromJson(Map<String, dynamic> json) => _$MadhviCreditFromJson(json);

  
  Map<String, dynamic> toJson() => _$MadhviCreditToJson(this);

}


@JsonSerializable(nullable: true)
class MadhviCreditList{

   List<MadhviCredit> walletTransaction;
   MadhviCreditList(
     {
       this.walletTransaction
       });

   factory MadhviCreditList.fromJson(Map<String, dynamic> json) => _$MadhviCreditListFromJson(json);

  
  Map<String, dynamic> toJson() => _$MadhviCreditListToJson(this);

}
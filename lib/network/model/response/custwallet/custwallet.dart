import 'package:json_annotation/json_annotation.dart';

part 'custwallet.g.dart';

@JsonSerializable(nullable: true)
class CustWallet {

  final double    total,walletLimitRs,walletPercent,walletMinAmt;

  CustWallet(this.total, this.walletLimitRs, this.walletPercent, this.walletMinAmt);


  factory CustWallet.fromJson(Map<String, dynamic> json) => _$CustWalletFromJson(json);


  Map<String, dynamic> toJson() => _$CustWalletToJson(this);

}


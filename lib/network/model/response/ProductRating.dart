import 'package:json_annotation/json_annotation.dart';
part 'ProductRating.g.dart';

@JsonSerializable(nullable: true)
class ProductRating{

  int ratingsId,custId,itemId,value,exInt1,exInt2,exFloat1,exFloat2;
  String insertDatetime,exVar1,exVar2;
 

  ProductRating(
      {this.ratingsId,
      this.custId,
      this.itemId,
      this.value,
      this.insertDatetime,
      this.exInt1,
      this.exInt2,
      this.exVar1,
      this.exVar2,
      this.exFloat1,
      this.exFloat2});

       factory ProductRating.fromJson(Map<String, dynamic> json) => _$ProductRatingFromJson(json);
   
     
     Map<String, dynamic> toJson() => _$ProductRatingToJson(this);
}
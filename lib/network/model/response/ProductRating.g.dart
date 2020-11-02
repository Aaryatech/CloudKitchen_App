// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductRating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRating _$ProductRatingFromJson(Map<String, dynamic> json) {
  return ProductRating(
    ratingsId: json['ratingsId'] as int,
    custId: json['custId'] as int,
    itemId: json['itemId'] as int,
    value: json['value'] as int,
    insertDatetime: json['insertDatetime'] as String,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
    exFloat1: json['exFloat1'] as int,
    exFloat2: json['exFloat2'] as int,
  );
}

Map<String, dynamic> _$ProductRatingToJson(ProductRating instance) =>
    <String, dynamic>{
      'ratingsId': instance.ratingsId,
      'custId': instance.custId,
      'itemId': instance.itemId,
      'value': instance.value,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'exFloat1': instance.exFloat1,
      'exFloat2': instance.exFloat2,
      'insertDatetime': instance.insertDatetime,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
    };

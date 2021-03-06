// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderHistory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistory _$OrderHistoryFromJson(Map<String, dynamic> json) {
  return OrderHistory(
    (json['orderList'] as List)
        ?.map((e) => e == null
            ? null
            : OrderHistoryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderHistoryToJson(OrderHistory instance) =>
    <String, dynamic>{
      'orderList': instance.orderList,
    };

OrderHistoryItem _$OrderHistoryItemFromJson(Map<String, dynamic> json) {
  return OrderHistoryItem(
    orderId: json['orderId'] as int,
    orderNo: json['orderNo'] as String,
    orderDate: json['orderDate'] as String,
    frId: json['frId'] as int,
    custId: json['custId'] as int,
    status: json['status'] as int,
    taxableAmt: (json['taxableAmt'] as num)?.toDouble(),
    cgstAmt: (json['cgstAmt'] as num)?.toDouble(),
    sgstAmt: (json['sgstAmt'] as num)?.toDouble(),
    igstAmt: (json['igstAmt'] as num)?.toDouble(),
    discAmt: (json['discAmt'] as num)?.toDouble(),
    itemDiscAmt: (json['itemDiscAmt'] as num)?.toDouble(),
    taxAmt: (json['taxAmt'] as num)?.toDouble(),
    totalAmt: (json['totalAmt'] as num)?.toDouble(),
    orderStatus: json['orderStatus'] as int,
    paidStatus: json['paidStatus'] as int,
    paymentMethod: json['paymentMethod'] as int,
    paymentRemark: json['paymentRemark'] as String,
    cityId: json['cityId'] as int,
    areaId: json['areaId'] as int,
    addressId: json['addressId'] as int,
    address: json['address'] as String,
    whatsappNo: json['whatsappNo'] as String,
    landmark: json['landmark'] as String,
    deliveryDate: json['deliveryDate'] as String,
    deliveryTime: json['deliveryTime'] as String,
    insertDateTime: json['insertDateTime'] as String,
    insertUserId: json['insertUserId'] as int,
    orderPlatform: json['orderPlatform'] as int,
    delStatus: json['delStatus'] as int,
    offerId: json['offerId'] as int,
    remark: json['remark'] as String,
    orderDeliveredBy: json['orderDeliveredBy'] as int,
    exInt1: json['exInt1'] as int,
    exInt2: json['exInt2'] as int,
    exInt3: json['exInt3'] as int,
    exInt4: json['exInt4'] as int,
    exVar1: json['exVar1'] as String,
    exVar2: json['exVar2'] as String,
    exVar3: json['exVar3'] as String,
    exVar4: json['exVar4'] as String,
    exFloat1: (json['exFloat1'] as num)?.toDouble(),
    exFloat2: (json['exFloat2'] as num)?.toDouble(),
    exFloat3: (json['exFloat3'] as num)?.toDouble(),
    exFloat4: (json['exFloat4'] as num)?.toDouble(),
    exDate1: json['exDate1'] as String,
    exDate2: json['exDate2'] as String,
    billingName: json['billingName'] as String,
    billingAddress: json['billingAddress'] as String,
    customerGstnNo: json['customerGstnNo'] as String,
    deliveryInstText: json['deliveryInstText'] as String,
    deliveryType: json['deliveryType'] as int,
    deliveryInstId: json['deliveryInstId'] as int,
    areaName: json['areaName'] as String,
    cityName: json['cityName'] as String,
    custName: json['custName'] as String,
    frName: json['frName'] as String,
    deliveryKm: (json['deliveryKm'] as num)?.toDouble(),
    deliveryCharges: (json['deliveryCharges'] as num)?.toDouble(),
    paymentSubMode: json['paymentSubMode'] as int,
    isAgent: json['isAgent'] as int,
    uuidNo: json['uuidNo'] as String,
    detailList: (json['detailList'] as List)
        ?.map((e) =>
            e == null ? null : DetailList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    trailList: (json['trailList'] as List)
        ?.map((e) =>
            e == null ? null : TrailList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderHistoryItemToJson(OrderHistoryItem instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'frId': instance.frId,
      'custId': instance.custId,
      'status': instance.status,
      'orderStatus': instance.orderStatus,
      'paidStatus': instance.paidStatus,
      'paymentMethod': instance.paymentMethod,
      'cityId': instance.cityId,
      'areaId': instance.areaId,
      'addressId': instance.addressId,
      'insertUserId': instance.insertUserId,
      'orderPlatform': instance.orderPlatform,
      'delStatus': instance.delStatus,
      'offerId': instance.offerId,
      'orderDeliveredBy': instance.orderDeliveredBy,
      'exInt1': instance.exInt1,
      'exInt2': instance.exInt2,
      'exInt3': instance.exInt3,
      'exInt4': instance.exInt4,
      'deliveryType': instance.deliveryType,
      'deliveryInstId': instance.deliveryInstId,
      'paymentSubMode': instance.paymentSubMode,
      'isAgent': instance.isAgent,
      'orderNo': instance.orderNo,
      'orderDate': instance.orderDate,
      'paymentRemark': instance.paymentRemark,
      'address': instance.address,
      'whatsappNo': instance.whatsappNo,
      'landmark': instance.landmark,
      'deliveryDate': instance.deliveryDate,
      'deliveryTime': instance.deliveryTime,
      'insertDateTime': instance.insertDateTime,
      'remark': instance.remark,
      'exVar1': instance.exVar1,
      'exVar2': instance.exVar2,
      'exVar3': instance.exVar3,
      'exVar4': instance.exVar4,
      'exDate1': instance.exDate1,
      'exDate2': instance.exDate2,
      'billingName': instance.billingName,
      'billingAddress': instance.billingAddress,
      'customerGstnNo': instance.customerGstnNo,
      'deliveryInstText': instance.deliveryInstText,
      'areaName': instance.areaName,
      'cityName': instance.cityName,
      'custName': instance.custName,
      'frName': instance.frName,
      'uuidNo': instance.uuidNo,
      'deliveryCharges': instance.deliveryCharges,
      'cgstAmt': instance.cgstAmt,
      'sgstAmt': instance.sgstAmt,
      'deliveryKm': instance.deliveryKm,
      'taxableAmt': instance.taxableAmt,
      'igstAmt': instance.igstAmt,
      'itemDiscAmt': instance.itemDiscAmt,
      'discAmt': instance.discAmt,
      'taxAmt': instance.taxAmt,
      'totalAmt': instance.totalAmt,
      'exFloat1': instance.exFloat1,
      'exFloat2': instance.exFloat2,
      'exFloat3': instance.exFloat3,
      'exFloat4': instance.exFloat4,
      'detailList': instance.detailList,
      'trailList': instance.trailList,
    };

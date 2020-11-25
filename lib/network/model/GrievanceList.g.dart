// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GrievanceList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrievanceList _$GrievanceListFromJson(Map<String, dynamic> json) {
  return GrievanceList(
    grievanceList: (json['grievanceList'] as List)
        ?.map((e) =>
            e == null ? null : Grievance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GrievanceListToJson(GrievanceList instance) =>
    <String, dynamic>{
      'grievanceList': instance.grievanceList,
    };

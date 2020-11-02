// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
    message: json['message'] as String,
    error: json['error'] as bool,
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'httpresponce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
    json['messege'] as String,
    json['error'] as bool,
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'messege': instance.messege,
      'error': instance.error,
    };

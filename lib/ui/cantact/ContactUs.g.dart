// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContactUs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUs _$ContactUsFromJson(Map<String, dynamic> json) {
  return ContactUs(
    error: json['error'] as bool,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ContactUsToJson(ContactUs instance) => <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMessage _$ApiMessageFromJson(Map<String, dynamic> json) {
  return ApiMessage(
    content: json['content'] as String,
    to: json['to'] as String,
    from: json['from'] as String,
  );
}

Map<String, dynamic> _$ApiMessageToJson(ApiMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'to': instance.to,
      'from': instance.from,
    };

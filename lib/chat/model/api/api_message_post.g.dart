// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_message_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiMessagePost _$ApiMessagePostFromJson(Map<String, dynamic> json) {
  return ApiMessagePost(
    content: json['content'] as String,
    token: json['token'] as String,
    to: json['to'] as String,
  );
}

Map<String, dynamic> _$ApiMessagePostToJson(ApiMessagePost instance) =>
    <String, dynamic>{
      'content': instance.content,
      'token': instance.token,
      'to': instance.to,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiConversation _$ApiConversationFromJson(Map<String, dynamic> json) {
  return ApiConversation(
    messages: (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : ApiMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    landlord: json['landlord'] as String,
    tenant: json['tenant'] as String,
  );
}

Map<String, dynamic> _$ApiConversationToJson(ApiConversation instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'landlord': instance.landlord,
      'tenant': instance.tenant,
    };

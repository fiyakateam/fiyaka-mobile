import 'package:json_annotation/json_annotation.dart';

import 'package:fiyaka/chat/model/api/api_message.dart';

part 'api_conversation.g.dart';

@JsonSerializable()
class ApiConversation {
  final List<ApiMessage> messages;
  final String landlord;
  final String tenant;

  ApiConversation({
    this.messages,
    this.landlord,
    this.tenant,
  });

  factory ApiConversation.fromJson(Map<String, dynamic> json) =>
      _$ApiConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ApiConversationToJson(this);
}

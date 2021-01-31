import 'package:json_annotation/json_annotation.dart';

part 'api_message.g.dart';

@JsonSerializable()
class ApiMessage {
  final String content;
  final String to;
  final String from;

  ApiMessage({
    this.content,
    this.to,
    this.from,
  });

  factory ApiMessage.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ApiMessageToJson(this);
}

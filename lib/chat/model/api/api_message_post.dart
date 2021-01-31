import 'package:json_annotation/json_annotation.dart';

part 'api_message_post.g.dart';

@JsonSerializable()
class ApiMessagePost {
  final String content;
  final String token;
  final String to;

  ApiMessagePost({
    this.content,
    this.token,
    this.to,
  });

  factory ApiMessagePost.fromJson(Map<String, dynamic> json) =>
      _$ApiMessagePostFromJson(json);

  Map<String, dynamic> toJson() => _$ApiMessagePostToJson(this);
}

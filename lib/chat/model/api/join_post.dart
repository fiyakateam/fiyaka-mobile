import 'package:json_annotation/json_annotation.dart';

part 'join_post.g.dart';

@JsonSerializable()
class JointPost {
  final String token;

  JointPost({
    this.token,
  });

  factory JointPost.fromJson(Map<String, dynamic> json) =>
      _$JointPostFromJson(json);

  Map<String, dynamic> toJson() => _$JointPostToJson(this);
}

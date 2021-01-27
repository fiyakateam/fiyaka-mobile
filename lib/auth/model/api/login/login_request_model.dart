import 'package:fiyaka/core/model/base_json_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends BaseJsonModel<LoginRequestModel> {
  final String email;
  final String password;

  LoginRequestModel({
    this.email,
    this.password,
  });

  @override
  LoginRequestModel baseFromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}

import 'package:fiyaka/core/model/base_json_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends BaseJsonModel<LoginResponseModel> {
  final String token;

  LoginResponseModel({
    this.token,
  });

  @override
  LoginResponseModel baseFromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

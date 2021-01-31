import 'package:fiyaka/auth/model/api/login/login_request_model.dart';
import 'package:fiyaka/auth/model/api/login/login_response_model.dart';
import 'package:fiyaka/auth/model/user_model.dart';
import 'package:fiyaka/core/constant/api_config.dart';
import 'package:fiyaka/core/service/http_service.dart';
import 'package:fiyaka/core/service/storage_service.dart';
import 'package:meta/meta.dart';

class AuthService {
  final HttpService httpService;
  final StorageService storageService;

  AuthService({
    @required this.httpService,
    @required this.storageService,
  });

  Future<UserModel> loginTenant(String email, String password) async {
    final req = LoginRequestModel(
      email: email,
      password: password,
    ).toJsonString();
    final res =
        await httpService.postParsed<LoginResponseModel, LoginResponseModel>(
      ApiConfig.login,
      LoginResponseModel(),
      payload: req,
    );

    if (res.success) {
      final token = res.data.token;
      final writeSuccess = await storageService.setString(
        'access_token',
        token,
      );
      if (writeSuccess) {
        return UserModel(
          email: email,
          name: '',
        );
      }
    }
    return null;
  }

  Future<bool> logout() async {
    return await storageService.setString('access_token', null);
  }

  Future<bool> status() async {
    final token = await storageService.getString('access_token');
    return token != null;
  }

  Future<UserModel> getProfile() async {
    final authStatus = await status();
    if (authStatus) {
      return UserModel(
        email: 'foo',
        name: 'goo',
      );
    }
    return null;
  }

  String readToken() {
    //TODO: Refresh token
    return storageService.getString('access_token');
  }
}

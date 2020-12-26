import 'package:fiyaka/core/locator.dart';
import 'package:fiyaka/core/router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class _LoginViewState {
  final bool loading;
  _LoginViewState({this.loading});
}

class Credentials {
  final String email;
  final String password;

  Credentials(this.email, this.password);
}

class LoginViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();
  var state = _LoginViewState(loading: false);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    state = _LoginViewState(loading: true);
    notifyListeners();

    //await Future.delayed(Duration(seconds: 2));

    state = _LoginViewState(loading: true);
    notifyListeners();
    await _navigatorService.navigateTo(Routes.profile,
        arguments: Credentials(email, password));
  }

  void unfocus(BuildContext context) => FocusScope.of(context).unfocus();
}

import 'package:fiyaka/core/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class _LoginViewState {
  final bool loading;
  _LoginViewState({this.loading});
}

class LoginViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();
  var state = _LoginViewState(loading: false);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    print('Email: $email, Password: $password');

    state = _LoginViewState(loading: true);
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    state = _LoginViewState(loading: true);
    notifyListeners();
  }

  void unfocus(BuildContext context) => FocusScope.of(context).unfocus();
}

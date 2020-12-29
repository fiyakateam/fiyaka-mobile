import 'package:fiyaka/core/locator.dart';
import 'package:fiyaka/core/router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    await _navigatorService.navigateTo(Routes.profile);
  }

  void unfocus(BuildContext context) => FocusScope.of(context).unfocus();
}

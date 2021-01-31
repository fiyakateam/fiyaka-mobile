import 'package:fiyaka/core/util/flash_util.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/locator.dart';
import '../../../core/router.dart';
import '../../service/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;

  Future<void> onSubmit(BuildContext context) async {
    loading = true;
    notifyListeners();
    final email = emailController.text;
    final password = passwordController.text;
    final res = await _authService.loginTenant(email, password);
    loading = false;
    if (res == null) {
      FlashUtil.showText(context, 'Could not login');
      notifyListeners();
    } else {
      FlashUtil.showText(context, 'Logged in as ${res.email}');
      await _navigatorService.clearStackAndShow(Routes.home);
    }
  }

  Future<void> checkInitial() async {
    loading = true;
    notifyListeners();
    final status = await _authService.status();
    loading = false;
    if (status) {
      await _navigatorService.clearStackAndShow(Routes.home);
    } else {
      notifyListeners();
    }
  }

  void unfocus(BuildContext context) => FocusScope.of(context).unfocus();
}

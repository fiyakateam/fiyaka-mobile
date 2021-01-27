import 'package:fiyaka/core/router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class LandingViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();

  void _navigateTo(String route) {
    _navigatorService.navigateTo(route);
  }

  void debug() async {
    print('debug');
  }

  void loginView() {
    _navigateTo(Routes.login);
  }

  void profileView() {
    _navigateTo(Routes.profile);
  }

  void changePasswordView() {
    _navigateTo(Routes.changePassword);
  }

  void changeEmailView() {
    _navigateTo(Routes.changeEmail);
  }
}

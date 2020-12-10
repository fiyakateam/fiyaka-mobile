import 'package:fiyaka/core/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();

  void login(String email, String password) {
    print('Email: $email, Password: $password');
  }
}

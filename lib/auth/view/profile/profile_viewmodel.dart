import 'package:fiyaka/core/locator.dart';
import 'package:fiyaka/core/router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();
  void editEmail() {
    _navigatorService.navigateTo(Routes.editEmail);
  }

  void editPassword() {}
}

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';
import '../../router.dart';

class NotFoundViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goLanding() {
    _navigationService.clearStackAndShow(Routes.landing);
  }
}

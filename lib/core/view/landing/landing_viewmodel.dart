import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../locator.dart';

class LandingViewModel extends BaseViewModel {
  final _navigatorService = locator<NavigationService>();

  void debug() async {
    print('Debug');
  }
}

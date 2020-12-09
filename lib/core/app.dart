import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'locator.dart';
import 'router.dart';

class MyApp extends StatelessWidget with MyRouter {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fiyaka',
      onGenerateRoute: generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}

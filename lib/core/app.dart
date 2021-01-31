import 'package:fiyaka/chat/service/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import 'locator.dart';
import 'router.dart';

class MyApp extends StatelessWidget with MyRouter {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<ChatService>(),
      child: MaterialApp(
        title: 'Fiyaka',
        onGenerateRoute: generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}

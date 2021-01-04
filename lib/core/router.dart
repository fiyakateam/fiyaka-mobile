import 'package:fiyaka/auth/view/login/login_view.dart';
import 'package:fiyaka/auth/view/profile/change/change_email_view.dart';
import 'package:fiyaka/auth/view/profile/change/change_password_view.dart';
import 'package:fiyaka/auth/view/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'view/landing/landing_view.dart';
import 'view/not_found/not_found_view.dart';

class Routes {
  static const String landing = '/';
  static const String login = '/login';
  static const String profile = '/profile';
  static const String changePassword = '/profile/changePassword';
  static const String changeEmail = '/profile/changeEmail';
}

abstract class MyRouter {
  MaterialPageRoute<dynamic> _generateRoute(
      Widget page, RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
    );
  }

  CupertinoPageRoute<dynamic> _generateCupertinoRoute(
      Widget page, RouteSettings settings) {
    return CupertinoPageRoute(
      builder: (context) => page,
      settings: settings,
    );
  }

  PageRoute<dynamic> _generateRouteWithNoAnimation(
      Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => page,
      transitionDuration: Duration(seconds: 0),
      settings: settings,
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.landing:
        return _generateRoute(LandingView(), settings);
      case Routes.login:
        return _generateRoute(LoginView(), settings);
      case Routes.profile:
        return _generateRoute(ProfileView(), settings);
      case Routes.changePassword:
        return _generateRoute(ChangePasswordView(), settings);
      case Routes.changeEmail:
        return _generateRoute(ChangeEmailView(), settings);
      default:
        return _generateRoute(NotFoundView(), settings);
    }
  }
}

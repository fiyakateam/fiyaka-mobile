import 'package:fiyaka/core/widget/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'landing_viewmodel.dart';

class LandingView extends ViewModelBuilderWidget<LandingViewModel> {
  @override
  LandingViewModel viewModelBuilder(BuildContext context) => LandingViewModel();

  @override
  bool get reactive => false;

  @override
  void onViewModelReady(LandingViewModel model) {}

  @override
  Widget builder(BuildContext context, LandingViewModel model, Widget child) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Landing',
      ),
      body: ListView(
        children: [
          Text('LandingView Debug Buttons'),
          RaisedButton(
            onPressed: model.debug,
            child: Text('DEBUG'),
          ),
          RaisedButton(
            onPressed: model.loginView,
            child: Text('LoginView'),
          ),
          RaisedButton(
            onPressed: model.profileView,
            child: Text('ProfileView'),
          ),
          RaisedButton(
            onPressed: model.changePasswordView,
            child: Text('ChangePasswordView'),
          ),
          RaisedButton(
            onPressed: model.changeEmailView,
            child: Text('ChangeEmailView'),
          ),
        ],
      ),
    );
  }
}

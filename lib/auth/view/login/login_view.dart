import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'login_viewmodel.dart';

class LoginView extends ViewModelBuilderWidget<LoginViewModel> {
  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  bool get reactive => false;

  @override
  void onViewModelReady(LoginViewModel model) {}

  @override
  Widget builder(BuildContext context, LoginViewModel model, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
      ),
      body: Center(
        child: Text('LoginView'),
      ),
    );
  }
}

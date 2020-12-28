import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'profile_viewmodel.dart';

class ProfileView extends ViewModelBuilderWidget<ProfileViewModel> {
  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();

  @override
  bool get reactive => false;

  @override
  void onViewModelReady(ProfileViewModel model) {}

  @override
  Widget builder(BuildContext context, ProfileViewModel model, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileView'),
      ),
      body: Center(
        child: Text('ProfileView'),
      ),
    );
  }
}

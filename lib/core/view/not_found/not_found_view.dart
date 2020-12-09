import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'not_found_viewmodel.dart';

class NotFoundView extends ViewModelBuilderWidget<NotFoundViewModel> {
  @override
  NotFoundViewModel viewModelBuilder(BuildContext context) =>
      NotFoundViewModel();

  @override
  bool get reactive => false;

  @override
  void onViewModelReady(NotFoundViewModel model) {}

  @override
  Widget builder(BuildContext context, NotFoundViewModel model, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotFoundView'),
      ),
      body: Center(
        child: Text('NotFoundView'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Go home'),
        onPressed: model.goLanding,
      ),
    );
  }
}

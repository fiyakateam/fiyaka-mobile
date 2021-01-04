import 'package:fiyaka/auth/widget/my_button.dart';
import 'package:fiyaka/auth/widget/password_field.dart';
import 'package:fiyaka/core/widget/my_app_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'change_password_viewmodel.dart';

class ChangePasswordView
    extends ViewModelBuilderWidget<ChangePasswordViewModel> {
  @override
  ChangePasswordViewModel viewModelBuilder(BuildContext context) =>
      ChangePasswordViewModel();

  @override
  bool get reactive => false;

  @override
  void onViewModelReady(ChangePasswordViewModel model) {}

  @override
  Widget builder(
      BuildContext context, ChangePasswordViewModel model, Widget child) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(98, 98, 98, 1.0),
      appBar: MyAppBar(
        title: 'Change Password',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 400,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PasswordField(
                          hintText: 'Current Password',
                          passwordController: model.currentPasswordController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PasswordField(
                          hintText: 'New Password',
                          passwordController: model.newPasswordController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PasswordField(
                          hintText: 'Re-Enter New Password',
                          passwordController: model.confirmPasswordController,
                        ),
                      ),
                      MyButton(
                        buttonText: 'Confirm',
                        width: 100,
                        bgColor: Colors.white,
                        txtColor: Colors.blue,
                        onPressed: () => model.confirmNewPassword(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

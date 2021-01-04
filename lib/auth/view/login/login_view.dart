import 'package:fiyaka/auth/widget/email_field.dart';
import 'package:fiyaka/auth/widget/my_button.dart';
import 'package:fiyaka/auth/widget/password_field.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'login_viewmodel.dart';

class LoginView extends ViewModelBuilderWidget<LoginViewModel> {
  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  bool get reactive => false;

  @override
  void onViewModelReady(LoginViewModel model) {
    model.checkInitial();
  }

  @override
  Widget builder(BuildContext context, LoginViewModel model, Widget child) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GestureDetector(
          onTap: () => model.unfocus(context),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(98, 98, 98, 1.0),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: 120.0,
                    horizontal: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      EmailField(
                        emailController: model.emailController,
                        hintText: 'Enter Your Email',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      PasswordField(
                        passwordController: model.passwordController,
                        hintText: 'Enter Your Password',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      MyButton(
                        bgColor: Colors.white,
                        txtColor: Colors.blue,
                        buttonText: 'LOGIN',
                        width: 200.0,
                        onPressed: () => model.onSubmit(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

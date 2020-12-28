import 'package:fiyaka/auth/view/edit/edit_password_viewmodel.dart';
import 'package:fiyaka/core/widget/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class EditPasswordView extends ViewModelBuilderWidget<EditPasswordViewModel> {
  Widget _passwordField(EditPasswordViewModel model) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 60.0,
      child: TextField(
        controller: model.passwordController,
        obscureText: true,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.white,
          ),
          hintText: 'Enter your Password',
          hintStyle: TextStyle(
            color: Colors.white54,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _confirmButton(EditPasswordViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 200,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {},
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Confirm',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget builder(
      BuildContext context, EditPasswordViewModel model, Widget child) {
    return Scaffold(
      appBar: MyAppBar(title: 'Change Password'),
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
                      _passwordField(model),
                      _passwordField(model),
                      _confirmButton(model)
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

  @override
  EditPasswordViewModel viewModelBuilder(BuildContext context) =>
      EditPasswordViewModel();
}

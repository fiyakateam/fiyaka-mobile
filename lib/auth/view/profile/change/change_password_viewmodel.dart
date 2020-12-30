import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChangePasswordViewModel extends BaseViewModel {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  void confirmNewPassword() {}
}

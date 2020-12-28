import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditPasswordViewModel extends BaseViewModel {
  final TextEditingController passwordController = TextEditingController();
  void unfocus(BuildContext context) => FocusScope.of(context).unfocus();
}

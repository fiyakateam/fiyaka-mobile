import 'dart:io';

import 'package:fiyaka/auth/model/user_model.dart';
import 'package:fiyaka/auth/service/auth_service.dart';
import 'package:fiyaka/core/locator.dart';
import 'package:fiyaka/core/router.dart';
import 'package:fiyaka/core/util/flash_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigatorService = locator<NavigationService>();
  File _image;
  final _picker = ImagePicker();
  PickedFile _pickedFile;
  UserModel user;
  bool loading = false;

  Future<void> changeProfilePic(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(title: Text('Camera/Gallery'), children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context); //close the dialog box
                _pickedFile =
                    await _picker.getImage(source: ImageSource.gallery);
                if (_pickedFile != null) {
                  _image = File(_pickedFile.path);
                } else {
                  print('No image selected.');
                }
              },
              child: const Text('Pick From Gallery'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context); //close the dialog box
                _pickedFile =
                    await _picker.getImage(source: ImageSource.camera);
              },
              child: const Text('Take A New Picture'),
            ),
          ]);
        });
  }

  void changeEmail() {
    _navigatorService.navigateTo(
      Routes.changeEmail,
    );
  }

  void changePassword() {
    _navigatorService.navigateTo(
      Routes.changePassword,
    );
  }

  Future<void> refreshProfile() async {
    loading = true;
    notifyListeners();
    final user = await _authService.getProfile();
    loading = false;
    if (user == null) {
      await _navigatorService.clearStackAndShow(Routes.login);
    } else {
      this.user = user;
      notifyListeners();
    }
  }

  Future<void> logOutPressed(BuildContext context) async {
    loading = true;
    notifyListeners();
    final success = await _authService.logout();
    loading = false;
    if (success) {
      FlashUtil.showText(context, 'Logged out');
      await _navigatorService.clearStackAndShow(Routes.login);
    } else {
      FlashUtil.showText(context, 'Could not log out');
      notifyListeners();
    }
  }

  void secretButtonPress(BuildContext context) {
    FlashUtil.showText(context, 'Ultra Secret Debug Menu');
    _navigatorService.navigateTo(Routes.landing);
  }
}

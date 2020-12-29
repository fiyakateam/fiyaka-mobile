import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  File _image;
  final _picker = ImagePicker();
  PickedFile _pickedFile;

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
    print('email');
  }

  void changePassword() {
    print('password');
  }
}
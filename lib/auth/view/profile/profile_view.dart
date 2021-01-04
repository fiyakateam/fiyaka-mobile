import 'package:fiyaka/auth/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/widget/my_app_bar.dart';
import 'profile_viewmodel.dart';

class ProfileView extends ViewModelBuilderWidget<ProfileViewModel> {
  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();

  @override
  bool get reactive => true;

  @override
  void onViewModelReady(ProfileViewModel model) {
    model.refreshProfile();
  }

  @override
  Widget builder(BuildContext context, ProfileViewModel model, Widget child) {
    Widget _infoSection(String type, String data) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                type,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              model.loading
                  ? CircularProgressIndicator()
                  : Text(
                      data,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                    ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: MyAppBar(
        title: 'Profile',
        leading: model.loading ? CircularProgressIndicator() : SizedBox(),
        actions: [
          FlatButton(
            color: Colors.transparent,
            child: Text(''),
            onPressed: () => model.secretButtonPress(context),
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(98, 98, 98, 1),
      body: RefreshIndicator(
        onRefresh: model.refreshProfile,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 70,
                      child: ClipOval(
                        child: Image.asset(
                          'asset/images/avatar.png',
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: Container(
                        height: 40,
                        width: 40,
                        child: GestureDetector(
                          onTap: () => model.changeProfilePic(context),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                        children: [
                          GestureDetector(
                            onTap: () => model.changeEmail(),
                            child:
                                _infoSection('Email:', model.user?.email ?? ''),
                          ),
                          GestureDetector(
                            onTap: () => model.changePassword(),
                            child: _infoSection('Password:', '***********'),
                          ),
                          MyButton(
                            onPressed: model.loading
                                ? null
                                : () => model.logOutPressed(context),
                            buttonText: 'Logout',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

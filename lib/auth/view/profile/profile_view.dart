import 'package:fiyaka/auth/view/login/login_viewmodel.dart';
import 'package:fiyaka/auth/view/profile/profile_viewmodel.dart';
import 'package:fiyaka/core/widget/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends ViewModelBuilderWidget<ProfileViewModel> {
  final Credentials credentials;

  ProfileView(this.credentials);
  @override
  Widget builder(BuildContext context, ProfileViewModel model, Widget child) {
    return Scaffold(
      appBar: MyAppBar(title: 'Profile'),
      backgroundColor: Color.fromRGBO(98, 98, 98, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundColor: Color.fromRGBO(196, 196, 196, 1),
            backgroundImage: NetworkImage(
                'https://www.pngkey.com/png/full/115-1150420_avatar-png-pic-male-avatar-icon-png.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Stack(
              alignment: Alignment.center,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                        ),
                        height: 60.0,
                        child: Row(
                          children: [
                            Icon(Icons.email),
                            Text(
                              credentials.email,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                        ),
                        height: 60.0,
                        child: Row(
                          children: [
                            Icon(Icons.lock),
                            Text(
                              credentials.password,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: 200,
                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: () => {
                          //TODO add editting credentials
                        },
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Color.fromRGBO(71, 255, 112, 1),
                        child: Text(
                          'EDIT',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}

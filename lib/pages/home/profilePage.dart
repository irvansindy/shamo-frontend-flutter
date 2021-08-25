import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/models/userModel.dart';
import 'package:shamo_app/provider/authProvider.dart';

import '../../theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: backColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/Default_Profile.png',
                    width: 64.0,
                  ),
                  // child: Image.network(
                  //   'user.profilePhotoUrl',
                  //   width: 64.0,
                  // ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, ${user.name}',
                          style: primaryTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 24.0)),
                      Text(
                        '@${user.username}',
                        style: subTitleTextStyle.copyWith(
                            fontWeight: regular, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/signIn', (route) => false),
                  child: Image.asset(
                    'assets/images/Exit.png',
                    width: 20.0,
                    height: 20.0,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(
                  fontWeight: regular, fontSize: 13.0),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        decoration: BoxDecoration(
          color: backColor3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Account',
              style: primaryTextStyle.copyWith(
                  fontWeight: semiBold, fontSize: 16.0),
            ),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/editProfile'),
                child: menuItem('Edit Profile')),
            menuItem('Your Orders'),
            menuItem('Help'),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'General',
              style: primaryTextStyle.copyWith(
                  fontWeight: semiBold, fontSize: 16.0),
            ),
            menuItem('Privacy & Policy'),
            menuItem('Term of Service'),
            menuItem('Rate App'),
          ],
        ),
      ));
    }

    return Column(
      children: [
        header(),
        // SizedBox(height: 10.0,),
        content(),
      ],
    );
  }
}

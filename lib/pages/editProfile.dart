import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/models/userModel.dart';
import 'package:shamo_app/provider/authProvider.dart';
// import 'package:flutter/services.dart';
import 'package:shamo_app/theme.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: backColor1,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Edit Profile',
            style:
                primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18.0),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: primaryColor,
                ),
                onPressed: () {}),
          ],
        ),
      );
    }

    Widget inputName() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(
                  fontWeight: regular, fontSize: 13.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '${user.name}',
                hintStyle: primaryTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 16,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subTitleColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputUsername() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(
                  fontWeight: regular, fontSize: 13.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '@${user.username}',
                hintStyle: primaryTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 16,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subTitleColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: secondaryTextStyle.copyWith(
                  fontWeight: regular, fontSize: 13.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '${user.email}',
                hintStyle: primaryTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 16,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: subTitleColor),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/Default_Profile.png',
                  ),
                ),
              ),
            ),
            inputName(),
            inputUsername(),
            inputEmail()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backColor3,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: primaryTextStyle.copyWith(
                  fontWeight: semiBold, fontSize: 24.0),
            ),
            SizedBox(
              height: 2.0,
            ),
            Text('Sign In to Countinue',
                style: subTitleTextStyle.copyWith(
                    fontWeight: regular, fontSize: 14.0))
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16.0),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: backColor2,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                  child: Row(
                children: [
                  Image.asset(
                    'assets/images/Email_Icon.png',
                    height: 12.0,
                    width: 17.0,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Email Address',
                        hintStyle: subTitleTextStyle,
                      ),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16.0),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: backColor2,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                  child: Row(
                children: [
                  Image.asset(
                    'assets/images/Password_Icon.png',
                    height: 12.0,
                    width: 17.0,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Password',
                        hintStyle: subTitleTextStyle,
                      ),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30.0),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
          ),
          child: Text(
            'Sign In',
            style: primaryTextStyle.copyWith(
              fontSize: 16.0,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an Account? ',
              style: subTitleTextStyle.copyWith(fontSize: 12.0),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/signUp'),
              child: Text(
                'Sign Up',
                style: purpleTextStyle.copyWith(
                    fontSize: 12.0, fontWeight: medium),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backColor1,
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              inputEmail(),
              inputPassword(),
              signInButton(),
              Spacer(),
              footer()
            ],
          ),
        ));
  }
}

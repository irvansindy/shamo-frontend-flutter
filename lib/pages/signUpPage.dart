import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/provider/authProvider.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/loadingButton.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        email: emailController.text,
        username: usernameController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Registrasi gagal',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: primaryTextStyle.copyWith(
                  fontWeight: semiBold, fontSize: 24.0),
            ),
            SizedBox(
              height: 2.0,
            ),
            Text('Register and Happy Shoping',
                style: subTitleTextStyle.copyWith(
                    fontWeight: regular, fontSize: 14.0))
          ],
        ),
      );
    }

    Widget inputName() {
      return Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
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
                    'assets/images/Username_Icon.png',
                    height: 12.0,
                    width: 17.0,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Full Name',
                        hintStyle: subTitleTextStyle,
                      ),
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      );
    }

    Widget inputUsername() {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
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
                    'assets/images/Username.png',
                    height: 12.0,
                    width: 17.0,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: usernameController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Username',
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

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
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
                      controller: emailController,
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
                      obscureText: true,
                      controller: passwordController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Your Password',
                        hintStyle: subTitleTextStyle,
                      ),
                    ),
                  )
                ],
              )),
            ),
          ],
        ),
      );
    }

    Widget signUpButton() {
      // return LoadingButton();
      return Container(
        height: 50.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30.0),
        child: TextButton(
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
          ),
          child: Text(
            'Sign Up',
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
              'Already have an account? ',
              style: subTitleTextStyle.copyWith(fontSize: 12.0),
            ),
            GestureDetector(
              // onTap: () => Navigator.pushNamed(context, '/signIn'),
              onTap: () => Navigator.pop(context),
              child: Text(
                'Sign In',
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
              inputName(),
              inputUsername(),
              inputEmail(),
              inputPassword(),
              isLoading ? LoadingButton() : signUpButton(),
              Spacer(),
              footer()
            ],
          ),
        ));
  }
}

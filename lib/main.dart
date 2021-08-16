import 'package:flutter/material.dart';
import 'package:shamo_app/pages/cartPage.dart';
import 'package:shamo_app/pages/checkoutPage.dart';
import 'package:shamo_app/pages/checkoutSuccessPage.dart';
import 'package:shamo_app/pages/detailChat.dart';
import 'package:shamo_app/pages/editProfile.dart';
import 'package:shamo_app/pages/home/mainPage.dart';
import 'package:shamo_app/pages/productPage.dart';
import 'package:shamo_app/pages/signInPage.dart';
import 'package:shamo_app/pages/signUpPage.dart';
import 'package:shamo_app/pages/splashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/signIn': (context) => SignInPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/chat': (context) => DetailChatPage(),
        '/editProfile': (context) => EditProfile(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkoutSuccess': (context) => CheckoutSuccessPage(),
      },
    );
  }
}

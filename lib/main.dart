import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/pages/cartPage.dart';
import 'package:shamo_app/pages/checkoutPage.dart';
import 'package:shamo_app/pages/checkoutSuccessPage.dart';
import 'package:shamo_app/pages/editProfile.dart';
import 'package:shamo_app/pages/home/mainPage.dart';
import 'package:shamo_app/pages/signInPage.dart';
import 'package:shamo_app/pages/signUpPage.dart';
import 'package:shamo_app/pages/splashPage.dart';
import 'package:shamo_app/provider/authProvider.dart';
import 'package:shamo_app/provider/cartProvider.dart';
import 'package:shamo_app/provider/productProvider.dart';
import 'package:shamo_app/provider/transactionProvider.dart';
import 'package:shamo_app/provider/wishlistProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/signIn': (context) => SignInPage(),
          '/signUp': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/editProfile': (context) => EditProfile(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkoutSuccess': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}

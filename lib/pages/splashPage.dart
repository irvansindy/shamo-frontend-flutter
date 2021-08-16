import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class SplashPage extends StatefulWidget {
  // const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/signIn')
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor1,
      body: Center(
          child: Container(
        width: 130.0,
        height: 150.0,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/Union.png')),
        ),
      )),
    );
  }
}

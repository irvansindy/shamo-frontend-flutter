import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backColor1,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Checkout Success',
        ),
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Empty_Cart.png',
              height: 70.0,
              width: 80.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'You made a transaction',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16.0),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Stay at home while we\nprepare your dream shoes',
              style: secondaryTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 44.0,
              width: 196.0,
              margin: EdgeInsets.only(top: defaultMargin),
              child: TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                  ),
                ),
                child: Text(
                  'Order Other Shoes',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Container(
              height: 44.0,
              width: 196.0,
              margin: EdgeInsets.only(top: 12.0),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: subTitleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                  ),
                ),
                child: Text(
                  'View My Order',
                  style: secondaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backColor3,
      appBar: header(),
      body: content(),
    );
  }
}

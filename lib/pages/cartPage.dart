import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/cartCard.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backColor1,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18.0),
        ),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Empty_Cart.png',
              width: 80.0,
              height: 69.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Opss! Your Cart is Empty',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16.0),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: subTitleTextStyle,
            ),
            Container(
              height: 44.0,
              width: 154.0,
              margin: EdgeInsets.only(top: 20.0),
              child: TextButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false),
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          CartCard(),
          CartCard(),
          CartCard(),
          CartCard(),
          CartCard(),
          CartCard(),
          CartCard(),
        ],
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 175.0,
        // width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    '\$120.40',
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              thickness: 0.3,
              color: subTitleColor,
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50.0,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/checkout'),
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 16.0),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primeTextColor,
                    ),
                  ],
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
      // body: emptyCart(),
      body: content(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}

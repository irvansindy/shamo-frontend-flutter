import 'package:flutter/material.dart';
import 'package:shamo_app/widget/wishlistCard.dart';

import '../../theme.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backColor1,
        centerTitle: true,
        title: Text(
          'Favorite Products',
          style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18.0),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Love.png',
                width: 74.0,
                height: 62.0,
              ),
              SizedBox(
                height: 23.0,
              ),
              Text(
                ' You don\'t have dream shoes?',
                style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 16.0),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'Let\'s find your favorite shoes',
                style: subTitleTextStyle,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 44.0,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 10.0),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                    child: Text(
                      'Explore Store',
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 16.0),
                    )),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
          color: backColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [
              WishlistCard(),
              WishlistCard(),
              WishlistCard(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // emptyWishlist(),
        content()
      ],
    );
  }
}

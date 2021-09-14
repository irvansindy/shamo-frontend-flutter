import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/provider/pageProvider.dart';
import 'package:shamo_app/provider/wishlistProvider.dart';
import 'package:shamo_app/widget/wishlistCard.dart';

import '../../theme.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

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
                    onPressed: () {
                      pageProvider.currentIndex = 0;
                    },
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
            children: wishlistProvider.wishlist
                .map(
                  (product) => WishlistCard(product),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content(),
      ],
    );
  }
}

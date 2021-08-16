import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/checkoutCard.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backColor1,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18.0,
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin,
        ),
        children: [
          // for list product item
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16.0,
                  ),
                ),
                CheckoutCard(),
                CheckoutCard(),
                CheckoutCard(),
              ],
            ),
          ),
          // for address
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            decoration: BoxDecoration(
              color: navColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/Store.png',
                          width: 40.0,
                          height: 40.0,
                        ),
                        Image.asset(
                          'assets/images/Line_Address.png',
                          height: 40.0,
                        ),
                        Image.asset(
                          'assets/images/Location.png',
                          height: 40.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: secondaryTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          'Adidas Core',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Your Location',
                          style: secondaryTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          'Planet Namek',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          // for payment summary
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            decoration: BoxDecoration(
              color: navColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      '3 Items',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 13.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      '\$180.60',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 13.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      'Free',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 11.0,
                ),
                Divider(
                  thickness: 1,
                  color: lineColor,
                ),
                SizedBox(
                  height: 11.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\$180.60',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // for button checkout
          SizedBox(
            height: 30.0,
          ),
          Divider(
            thickness: 1,
            color: lineColor,
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            child: TextButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/checkoutSuccess',
                (route) => false,
              ),
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Checkout Now',
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backColor3,
      appBar: header(),
      body: content(),
    );
  }
}

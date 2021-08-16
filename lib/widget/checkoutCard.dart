import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class CheckoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 12.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        color: navColor,
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12.0,
              ),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/Image_Sample.png',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ultraboots 20 Shoes',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(
                  '\$60.20',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            '1 Items',
            style: secondaryTextStyle.copyWith(
              fontWeight: light,
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }
}

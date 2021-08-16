import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class WishlistCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding:
          EdgeInsets.only(top: 10.0, bottom: 14.0, left: 12.0, right: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), color: navColor),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              'assets/images/Image_Sample.png',
              width: 60.0,
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
                ),
                Text(
                  '\$60.20',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/After_Wistlist.png',
            width: 34.0,
          ),
        ],
      ),
    );
  }
}

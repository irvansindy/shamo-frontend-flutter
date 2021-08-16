import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product'),
      child: Container(
        width: 215.0,
        height: 278.0,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: productColor2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Image.asset(
              'assets/images/Image_Sample.png',
              height: 150.0,
              width: 215.0,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Running',
                    style: secondaryTextStyle.copyWith(
                        fontWeight: regular, fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    'Ultraboots 20 Shoes',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    '\$60.20',
                    style: priceTextStyle.copyWith(
                        fontWeight: medium, fontSize: 14.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

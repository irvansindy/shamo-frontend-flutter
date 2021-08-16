import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class CartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: navColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Image_Sample.png'),
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
                      style: primaryTextStyle.copyWith(fontWeight: semiBold),
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
              Column(
                children: [
                  Image.asset(
                    'assets/images/Add.png',
                    width: 16.0,
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '2',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Image.asset(
                    'assets/images/Reduce.png',
                    width: 16.0,
                    height: 16.0,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/Remove.png',
                width: 10.0,
                height: 12.0,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                'Remove',
                style: redTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

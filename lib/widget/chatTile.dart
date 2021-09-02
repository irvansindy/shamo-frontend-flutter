import 'package:flutter/material.dart';
import 'package:shamo_app/models/productModel.dart';
import 'package:shamo_app/pages/detailChat.dart';
import 'package:shamo_app/theme.dart';

class ChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailChatPage(UninitializedProductModel()),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
          top: 33.0,
        ),
        child: Column(
          children: [
            Row(children: [
              Image.asset(
                'assets/images/Union.png',
                width: 54.0,
              ),
              SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sharon Mina',
                      style: primaryTextStyle.copyWith(
                          fontWeight: regular, fontSize: 15.0),
                    ),
                    Text(
                      'Good night, have a nice dream baby',
                      style: secondaryTextStyle.copyWith(
                        fontWeight: light,
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Text(
                'Now',
                style: secondaryTextStyle.copyWith(
                    fontWeight: regular, fontSize: 10.0),
              ),
            ]),
            SizedBox(height: 12.0),
            Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            )
          ],
        ),
      ),
    );
  }
}

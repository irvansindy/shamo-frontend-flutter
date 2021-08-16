import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/chatBubble.dart';

class DetailChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // app bar cant use with widget
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: backColor1,
          centerTitle: false,
          title: Row(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/Profile_Online.png',
                width: 50.0,
                height: 50.0,
              ),
              SizedBox(
                width: 12.0,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Sharon Mina',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 14.0),
                ),
                Text(
                  'Online',
                  style: secondaryTextStyle.copyWith(
                      fontWeight: light, fontSize: 12.0),
                ),
              ]),
            ],
          ),
        ),
      );
    }

    Widget productPreview() {
      return Container(
        width: 225.0,
        height: 74.0,
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: prevProductColor,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: primaryColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/Image_Sample.png',
                width: 54.0,
                height: 54.0,
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ultraboots 20 Shoes',
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '\$60.20',
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/Close.png',
              height: 22.0,
              width: 22.0,
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45.0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: navColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Type Message...',
                            hintStyle: subTitleTextStyle),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Image.asset(
                  'assets/images/Send_Button.png',
                  width: 45.0,
                  height: 45.0,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          ChatBubble(
            isSender: true,
            text: 'Hi, This item is still available?',
            hasProduct: true,
          ),
          ChatBubble(
            isSender: false,
            text: 'Good night, This item is only available in size 42 and 43',
            hasProduct: false,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}

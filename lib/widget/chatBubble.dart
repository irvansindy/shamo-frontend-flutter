import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class ChatBubble extends StatelessWidget {
  final String? text;
  final bool? isSender;
  final bool? hasProduct;

  ChatBubble({this.isSender = false, this.text = '', this.hasProduct = false});

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 230.0,
        margin: EdgeInsets.only(bottom: 12.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSender! ? prevProductColor : navColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender! ? 12.0 : 0),
            topRight: Radius.circular(isSender! ? 0 : 12.0),
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'assets/images/Image_Sample.png',
                    width: 70.0,
                    height: 70.0,
                    // fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COURT VISION 2.0 SHOES',
                        style: primaryTextStyle,
                        // overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        '\$60.20',
                        style: priceTextStyle.copyWith(fontWeight: medium),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        )),
                    child: Text(
                      'Add to Cart',
                      style: purpleTextStyle,
                    )),
                SizedBox(
                  width: 8.0,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: defaultMargin),
      child: Column(
        crossAxisAlignment:
            isSender! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct! ? productPreview() : SizedBox(),
          Row(
            mainAxisAlignment:
                isSender! ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: isSender! ? prevProductColor : navColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender! ? 12.0 : 0),
                      topRight: Radius.circular(isSender! ? 0 : 12.0),
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    text!,
                    style: primaryTextStyle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/models/messageModel.dart';
import 'package:shamo_app/models/productModel.dart';
import 'package:shamo_app/provider/authProvider.dart';
import 'package:shamo_app/services/messageService.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/widget/chatBubble.dart';

// ignore: must_be_immutable
class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage(this.product);

  @override
  _DetailChatPageState createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      await MessageService().addMessage(
        user: authProvider.user,
        isFromUser: true,
        product: widget.product,
        message: messageController.text,
      );

      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

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
              child: Image.network(
                widget.product.galleries![0].url!,
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
                    widget.product.name!,
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '\$ ${widget.product.price!}',
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Image.asset(
                'assets/images/Close.png',
                height: 22.0,
                width: 22.0,
              ),
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
            widget.product is UninitializedProductModel
                ? SizedBox()
                : productPreview(),
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
                        controller: messageController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type Message...',
                          hintStyle: subTitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Image.asset(
                    'assets/images/Send_Button.png',
                    width: 45.0,
                    height: 45.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream:
              MessageService().getMessageByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                children: snapshot.data!
                    .map(
                      (MessageModel message) => ChatBubble(
                        isSender: message.isFromUser,
                        text: message.message,
                        product: message.product,
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: backColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}

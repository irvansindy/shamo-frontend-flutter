import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/models/messageModel.dart';
import 'package:shamo_app/provider/authProvider.dart';
import 'package:shamo_app/provider/pageProvider.dart';
import 'package:shamo_app/services/messageService.dart';
import 'package:shamo_app/widget/chatTile.dart';

import '../../theme.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18.0),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          color: backColor3,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Headset.png',
                width: 80.0,
                height: 80.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Opss no message yet?',
                style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 16.0),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'You have never done a transaction',
                style: subTitleTextStyle,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 44.0,
                width: 152.0,
                child: TextButton(
                    onPressed: () {
                      pageProvider.currentIndex = 0;
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 10.0),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
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

    Widget contentChat() {
      return StreamBuilder<List<MessageModel>>(
          stream:
              MessageService().getMessageByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return emptyChat();
              }

              return Expanded(
                child: Container(
                  width: double.infinity,
                  color: backColor3,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    children: [
                      ChatTile(snapshot.data![snapshot.data!.length - 1])
                    ],
                  ),
                ),
              );
            } else {
              return emptyChat();
            }
          });
    }

    return Column(
      children: [header(), contentChat()],
    );
  }
}

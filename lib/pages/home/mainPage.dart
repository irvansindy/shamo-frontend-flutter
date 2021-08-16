import 'package:flutter/material.dart';
import 'package:shamo_app/pages/home/chatPage.dart';
import 'package:shamo_app/pages/home/homePage.dart';
import 'package:shamo_app/pages/home/profilePage.dart';
import 'package:shamo_app/pages/home/wishlistPage.dart';
import 'package:shamo_app/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cart'),
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/images/Cart_Icon.png',
          width: 20.0,
          height: 22.0,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12.0,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: navColor,
              currentIndex: currentIndex,
              onTap: (value) {
                // print(value);
                setState(() => currentIndex = value);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Image.asset(
                        'assets/images/Home.png',
                        width: 21.0,
                        color: currentIndex == 0
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Image.asset(
                        'assets/images/Chat_Icon.png',
                        width: 20.0,
                        color: currentIndex == 1
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Image.asset(
                        'assets/images/Wishlist.png',
                        width: 20.0,
                        color: currentIndex == 2
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Image.asset(
                        'assets/images/Profile.png',
                        width: 18.0,
                        color: currentIndex == 3
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    ),
                    label: ''),
              ]),
        ),
      );
    }

    Widget customBody() {
      // return
      // ignore: dead_code
      switch (currentIndex) {
        case 0:
          return HomePage();
          // ignore: dead_code
          break;
        case 1:
          return ChatPage();
          // ignore: dead_code
          break;
        case 2:
          return WishlistPage();
          // ignore: dead_code
          break;
        case 3:
          return ProfilePage();
          // ignore: dead_code
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backColor1 : backColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: customBody(),
    );
  }
}

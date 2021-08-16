import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/images/Image_Sample.png',
    'assets/images/Image_Sample.png',
    'assets/images/Image_Sample.png',
  ];

  List familiarProduct = [
    'assets/images/Image_Sample.png',
    'assets/images/Image_Sample.png',
    'assets/images/Image_Sample.png',
    'assets/images/Image_Sample.png',
    'assets/images/Image_Sample.png',
    'assets/images/Image_Sample.png',
    'assets/images/Image_Sample.png',
    'assets/images/Image_Sample.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16.0 : 4.0,
        height: 4.0,
        margin: EdgeInsets.symmetric(
          horizontal: 2.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: currentIndex == index ? primaryColor : secondTextColor,
        ),
      );
    }

    Widget familiarProductCard(String imageUrl) {
      return Container(
        width: 54.0,
        height: 54.0,
        margin: EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imageUrl)),
          borderRadius: BorderRadius.circular(6.0),
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20.0,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backColor1,
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: images
                .map((image) => Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17.0),
        // padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24.0),
          ),
          color: backColor1,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                // for name product
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ultraboots 20 Shoes',
                          style: primaryTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 18.0),
                        ),
                        Text(
                          'Running',
                          style: subTitleTextStyle.copyWith(
                              fontWeight: regular, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/Before_Wistlist.png',
                    width: 46.0,
                  ),
                ],
              ),
            ),
            // for price product
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: 20.0, left: defaultMargin, right: defaultMargin),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: backColor2,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    '\$60.20',
                    style: priceTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16.0),
                  )
                ],
              ),
            ),
            // for desc product
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Unpaved trails and mixed surfaces are easy when you have the traction and support youneed. Casual enough for the daily commute.',
                    style: subTitleTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
            // for familiar product
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Familiar Shoes',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarProduct.map((image) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                              left: index == 0 ? defaultMargin : 0),
                          child: familiarProductCard(image),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // for button cart and chat
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  Container(
                    width: 54.0,
                    height: 54.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Button_Chat.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 54.0,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                              fontWeight: medium, fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: productColor2,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}

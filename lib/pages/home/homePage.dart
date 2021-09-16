import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/models/userModel.dart';
import 'package:shamo_app/provider/authProvider.dart';
import 'package:shamo_app/provider/categoryProvider.dart';
import 'package:shamo_app/provider/productProvider.dart';
import 'package:shamo_app/widget/categoryTile.dart';
import 'package:shamo_app/widget/productCard.dart';
import 'package:shamo_app/widget/productTile.dart';
import '../../theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${user.name}',
                    style: primaryTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: subTitleTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 54.0,
              width: 54.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    user.profilePhotoUrl!,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: categoryProvider.categories
                    .map(
                      (categories) => CategoryTile(categories),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 22.0,
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14.0, right: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: productProvider.products
                    .map(
                      (product) => ProductCard(product),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget newArrivalProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          'New Arrivals',
          style:
              primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 22.0),
        ),
      );
    }

    Widget newArrivalProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14.0),
        child: Column(
          children: productProvider.products
              .map(
                (product) => ProductTile(product),
              )
              .toList(),
        ),
      );
    }

    return SafeArea(
      child: ListView(
        children: [
          header(),
          categories(),
          popularProductsTitle(),
          popularProducts(),
          newArrivalProductsTitle(),
          newArrivalProducts(),
        ],
      ),
    );
  }
}

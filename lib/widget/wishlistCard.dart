import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/models/productModel.dart';
import 'package:shamo_app/provider/wishlistProvider.dart';
import 'package:shamo_app/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  WishlistCard(this.product);
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding:
          EdgeInsets.only(top: 10.0, bottom: 14.0, left: 12.0, right: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), color: navColor),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              product.galleries[0].url!,
              width: 60.0,
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
                  product.name!,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '\$${product.price!}',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: alertColor,
                  content: Text(
                    'Product has been removed from Wishlist',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            child: Image.asset(
              'assets/images/After_Wistlist.png',
              width: 34.0,
            ),
          ),
        ],
      ),
    );
  }
}

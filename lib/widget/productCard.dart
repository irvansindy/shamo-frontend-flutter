import 'package:flutter/material.dart';
import 'package:shamo_app/models/productModel.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/pages/productPage.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductPage(product),
        ),
      ),
      child: Container(
        width: 215.0,
        height: 278.0,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: productColor2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Image.network(
              product.galleries[0].url!,
              height: 150.0,
              width: 215.0,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name!,
                    style: secondaryTextStyle.copyWith(
                        fontWeight: regular, fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    product.name!,
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    '\$${product.price!}',
                    style: priceTextStyle.copyWith(
                        fontWeight: medium, fontSize: 14.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shamo_app/models/productModel.dart';
import 'package:shamo_app/pages/productPage.dart';
import 'package:shamo_app/theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);

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
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                product.galleries![0].url!,
                width: 120.0,
                height: 120.0,
                fit: BoxFit.cover,
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
                    product.category!.name!,
                    style: secondaryTextStyle.copyWith(
                        fontWeight: regular, fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    product.name!,
                    style: primaryTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    '\$${product.price!}',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

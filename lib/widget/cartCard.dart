import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/models/cartModel.dart';
import 'package:shamo_app/provider/cartProvider.dart';
import 'package:shamo_app/theme.dart';

// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: navColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      cart.product.galleries![0].url!,
                    ),
                  ),
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
                      cart.product.name!,
                      style: primaryTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      '\$${cart.product.price!}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => cartProvider.addQuantity(cart.id!),
                    child: Image.asset(
                      'assets/images/Add.png',
                      width: 16.0,
                      height: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  GestureDetector(
                    onTap: () => cartProvider.reduceQuantity(cart.id!),
                    child: Image.asset(
                      'assets/images/Reduce.png',
                      width: 16.0,
                      height: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12.0,
          ),
          GestureDetector(
            onTap: () => cartProvider.removeCart(cart.id!),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Remove.png',
                  width: 10.0,
                  height: 12.0,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  'Remove',
                  style: redTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

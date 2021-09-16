import 'package:flutter/material.dart';
import 'package:shamo_app/theme.dart';
import 'package:shamo_app/models/categoryModel.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel categories;
  CategoryTile(this.categories);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        margin: EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: primaryColor,
        ),
        child: Text(
          categories.name!,
          style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 13.0),
        ));
  }
}

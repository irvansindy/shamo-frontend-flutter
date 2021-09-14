import 'package:flutter/material.dart';
import 'package:shamo_app/models/categoryModel.dart';
import 'package:shamo_app/services/productCategoriesService.dart';

class CategoryProvider with ChangeNotifier {
  late List<CategoryModel> _categories = [];

  // set getter
  List<CategoryModel> get categories => _categories;

  // setter
  set categories(List<CategoryModel> categories) {
    _categories = categories;
    notifyListeners();
  }

  Future<void> getCategories() async {
    try {
      List<CategoryModel> categories = await CategoryService().getCategories();
      _categories = categories;
    } catch (e) {}
  }
}

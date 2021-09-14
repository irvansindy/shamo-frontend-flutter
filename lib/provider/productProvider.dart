import 'package:shamo_app/models/productModel.dart';
import 'package:flutter/material.dart';
  import 'package:shamo_app/services/productService.dart';

class ProductProvider with ChangeNotifier {
  late List<ProductModel> _products = [];

  // set getter
  List<ProductModel> get products => _products;

  // set setter
  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}

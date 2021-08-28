import 'package:flutter/material.dart';
import 'package:shamo_app/models/productModel.dart';

class WishlistProvider with ChangeNotifier {
  List<ProductModel> _wishlist = [];

  // set getter
  List<ProductModel> get wishlist => _wishlist;

  // set setter
  set wishlist(List<ProductModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  // function penambahan dan penghapusan wishlist
  setProduct(ProductModel product) {
    if (!isWishlist(product)) {
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
    }
  
    notifyListeners();
  }

  // pengecekan data wishlist
  isWishlist(ProductModel product) {
    if (_wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}

import 'package:shamo_app/models/categoryModel.dart';
import 'package:shamo_app/models/galleryModel.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  CategoryModel? category;
  List<GalleryModel>? galleries;
  DateTime? createAt;
  DateTime? updateAt;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.galleries,
    this.createAt,
    this.updateAt,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    tags = json['tags'];
    description = json['description'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createAt = DateTime.parse(json['created_at']);
    updateAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'tags': tags,
      'description': description,
      'category': category!.toJson(),
      'galleries': galleries!.map((gallery) => gallery.toJson()).toList(),
      'created_at': createAt.toString(),
      'updated_at': updateAt.toString(),
    };
  }
}

class UninitializedProductModel extends ProductModel {
  // UninitializedProductModel() : super();
  // UninitializedProductModel.fromJson(Map<String, dynamic> json)
  //     : super.fromJson(json);
}

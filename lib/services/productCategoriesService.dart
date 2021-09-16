import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shamo_app/models/categoryModel.dart';

class CategoryService {
  // String? baseUrl = 'http://10.0.2.2:8000/api';
  // String? baseUrl = 'http://127.0.0.1:8000/api';
  String? baseUrl = 'http://192.168.1.7:8000/api';

  Future<List<CategoryModel>> getCategories() async {
    var url = '$baseUrl/categories';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<CategoryModel> categories = [];

      for (var item in data) {
        categories.add(CategoryModel.fromJson(item));
      }

      return categories;
    } else {
      throw Exception('Data produk kategori gagal diambil');
    }
  }
}

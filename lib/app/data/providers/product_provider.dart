import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Product>> getProducts({int? categoryId}) async {
    try {
      final data = await rootBundle.loadString('assets/json/product.json');
      final response = jsonDecode(data) as List;

      final filteredProducts = categoryId == null
          ? response
          : response
                .where((item) => item['category_id'] == categoryId)
                .toList();

      return filteredProducts.map<Product>((x) => Product.fromJson(x)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

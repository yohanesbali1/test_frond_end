import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Product>> getProducts({int? categoryId, String? search}) async {
    try {
      final data = await rootBundle.loadString('assets/json/product.json');
      final response = jsonDecode(data) as List;

      final filteredProducts = response.where((item) {
        final matchCategory =
            categoryId == null || item['category_id'] == categoryId;

        final matchSearch =
            search == null ||
            search.isEmpty ||
            item['name'].toString().toLowerCase().contains(
              search.toLowerCase(),
            );

        return matchCategory && matchSearch;
      }).toList();

      return filteredProducts.map<Product>((x) => Product.fromJson(x)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

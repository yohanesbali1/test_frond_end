import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Product>> getProducts() async {
    try {
      final data = await rootBundle.loadString('assets/json/product.json');
      final response = jsonDecode(data) as List;
      return List<Product>.from(response.map((x) => Product.fromJson(x)));
    } catch (e) {
      rethrow;
    }
  }
}

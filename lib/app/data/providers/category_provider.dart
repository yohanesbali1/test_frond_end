import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';

class CategoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<Category>> getCategory() async {
    try {
      final data = await rootBundle.loadString('assets/json/categories.json');
      final response = jsonDecode(data) as List;
      return List<Category>.from(response.map((x) => Category.fromJson(x)));
    } catch (e) {
      rethrow;
    }
  }
}

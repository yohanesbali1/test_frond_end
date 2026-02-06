import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/data/providers/category_provider.dart';
import 'package:testing_front_end_dev/app/data/providers/product_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final selectedIndex = 0.obs;
  final count = 0.obs;
  final date = DateFormat('dd MMMM yyyy').format(DateTime.now());
  final products = [].obs;
  final category = [].obs;
  final RxList<OrderModel> order = [
    OrderModel(
      id: 1,
      name: 'Choso Dishes',
      price: 500000,
      qty: 4,
      image:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    ),
    OrderModel(
      id: 2,
      name: 'Choso Dishes',
      price: 500000,
      qty: 1,
      image:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    ),
    OrderModel(
      id: 3,
      name: 'Choso Dishes',
      price: 500000,
      qty: 1,
      image:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    ),
    OrderModel(
      id: 4,
      name: 'Choso Dishes',
      price: 500000,
      qty: 1,
      image:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    ),
    OrderModel(
      id: 5,
      name: 'Choso Dishes',
      price: 500000,
      qty: 1,
      image:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    ),
  ].obs;
  final isLoading = false.obs;
  final ProductProvider productProvider = ProductProvider();
  final CategoryProvider categoryProvider = CategoryProvider();

  @override
  void onInit() {
    super.onInit();
    getProducts();
    getCategory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int get subTotal {
    return order.fold(0, (sum, item) => sum + item.total);
  }

  Future<void> getProducts() async {
    try {
      var response = await productProvider.getProducts();
      products.value = response;
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCategory() async {
    try {
      var response = await categoryProvider.getCategory();
      category.value = response;
      isLoading.value = false;
    } catch (e) {
      print(e);
    }
  }

  void addOrder(Product product) {
    final orderItem = order.firstWhereOrNull((e) => e.id == product.id);

    if (orderItem == null) {
      order.add(
        OrderModel(
          id: product.id,
          name: product.name,
          price: product.price,
          image: product.image,
          qty: 1,
        ),
      );
    } else {
      final i = order.indexOf(orderItem);
      order[i] = orderItem.copyWith(qty: orderItem.qty + 1);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/data/providers/category_provider.dart';
import 'package:testing_front_end_dev/app/data/providers/product_provider.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/modal/checkout/index.dart';

class HomeController extends GetxController {
  final Rxn<Category> selectedCategory = Rxn<Category>();
  final count = 0.obs;
  final date = DateFormat('dd MMMM yyyy').format(DateTime.now());
  final products = [].obs;
  final category = [].obs;
  final RxList<OrderModel> order = <OrderModel>[].obs;
  final isLoading = true.obs;
  final ProductProvider productProvider = ProductProvider();
  final CategoryProvider categoryProvider = CategoryProvider();
  final Map<int, double> scales = {};
  double scaleOf(int index) => scales[index] ?? 1.0;

  @override
  void onInit() {
    super.onInit();
    getProducts();
    getCategory();

    ever(selectedCategory, (_) => getProducts());
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
      isLoading.value = true;
      var response = await productProvider.getProducts(
        categoryId: selectedCategory.value?.id ?? null,
      );
      products.value = response;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCategory() async {
    try {
      var response = await categoryProvider.getCategory();
      category.value = response;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
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
      final updated = orderItem.copyWith(qty: orderItem.qty + 1);
      order[i] = updated;
      order.value = List.from(order);
    }
  }

  void press(int index) {
    scales[index] = 0.95;
    update(['item_$index']);
  }

  void release(int index) {
    scales[index] = 1.0;
    update(['item_$index']);
  }

  Future<void> submit() async {
    if (isLoading.value) return;
    isLoading.value = true;
    Get.generalDialog(
      barrierDismissible: true,
      barrierColor: Colors.black26,
      barrierLabel: 'Dismiss',
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return CustomRightModal();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1, 0), // mulai dari kanan
            end: Offset(0, 0), // ke posisi normal
          ).animate(animation),
          child: child,
        );
      },
    );
    isLoading.value = false;
  }
}

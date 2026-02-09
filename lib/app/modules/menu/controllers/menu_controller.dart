import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/data/providers/category_provider.dart';
import 'package:testing_front_end_dev/app/data/providers/product_provider.dart';
import 'package:testing_front_end_dev/app/modules/menu/controllers/form_item_controller.dart';
import 'package:testing_front_end_dev/app/modules/menu/views/widget/modal/index.dart';

class MenusController extends GetxController {
  final CategoryProvider categoryProvider = CategoryProvider();
  final ProductProvider productProvider = ProductProvider();
  final Rxn<Category> selectedCategory = Rxn<Category>();
  final category = [].obs;
  final products = [].obs;
  final isLoading = true.obs;
  final Map<int, double> scales = {};
  double scaleOf(int index) => scales[index] ?? 1.0;
  @override
  void onInit() {
    super.onInit();
    getProducts();
    getCategory();
    ever(selectedCategory, (_) {
      getProducts();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getProducts() async {
    try {
      isLoading.value = true;
      products.clear();
      products.add([]);
      var response = await productProvider.getProducts(
        categoryId: selectedCategory.value?.id ?? null,
      );
      products.addAll(response);
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

  void press(int index) {
    scales[index] = 0.95;
    update(['item_$index']);
  }

  void release(int index) {
    scales[index] = 1.0;
    update(['item_$index']);
  }

  Future<void> openModal([Product? product]) async {
    if (isLoading.value) return;
    isLoading.value = true;
    Get.generalDialog(
      barrierDismissible: true,
      barrierColor: Colors.black26,
      barrierLabel: 'Dismiss',
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return GetBuilder<FormItemController>(
          init: FormItemController(product),
          builder: (_) => CustomRightModal(),
        );
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

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/data/providers/category_provider.dart';
import 'package:testing_front_end_dev/app/data/providers/product_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final date = DateFormat('dd MMMM yyyy').format(DateTime.now());
  final products = [].obs;
  final category = [].obs;
  final RxList<OrderModel> order = [
    OrderModel(
      id: 1,
      name: 'Choso Dishes',
      price: 5000,
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
}

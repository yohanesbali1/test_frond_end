import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/data/providers/category_provider.dart';
import 'package:testing_front_end_dev/app/data/providers/product_provider.dart';

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
      print('Category berubah: ');
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
      print(selectedCategory.value?.id);
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

  void press(int index) {
    scales[index] = 0.95;
    update(['item_$index']);
  }

  void release(int index) {
    scales[index] = 1.0;
    update(['item_$index']);
  }
}

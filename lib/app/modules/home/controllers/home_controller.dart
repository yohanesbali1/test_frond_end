import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/data/providers/category_provider.dart';
import 'package:testing_front_end_dev/app/data/providers/product_provider.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;
  final count = 0.obs;
  final date = DateFormat('dd MMMM yyyy').format(DateTime.now());
  final products = [].obs;
  final category = [].obs;
  final RxList<OrderModel> order = <OrderModel>[].obs;
  final isLoading = false.obs;
  final ProductProvider productProvider = ProductProvider();
  final CategoryProvider categoryProvider = CategoryProvider();
  final Map<int, double> scales = {};
  double scaleOf(int index) => scales[index] ?? 1.0;

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
}

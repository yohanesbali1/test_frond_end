part of 'models.dart';

class OrderModel {
  final int id;
  final String name;
  final int price;
  final int qty;
  final String image;

  OrderModel({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
    required this.image,
  });
}

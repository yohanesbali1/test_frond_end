part of 'models.dart';

class OrderModel {
  final int? id;
  final String name;
  final int price;
  final int qty;
  final String? image;
  final String? note;

  OrderModel({
    this.id,
    required this.name,
    required this.price,
    required this.qty,
    this.image,
    this.note,
  });

  OrderModel copyWith({
    String? name,
    int? price,
    String? note,
    int? qty,
    String? image,
  }) {
    return OrderModel(
      id: id,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      note: note ?? this.note,
      qty: qty ?? this.qty,
    );
  }

  int get total => price * qty;
}

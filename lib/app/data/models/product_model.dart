part of 'models.dart';

enum OrderType { dineIn, takeaway }

class Product {
  final int id;
  final String name;
  final int price;
  final int categoryId;
  final OrderType type;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.type,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      categoryId: json['category_id'] as int,
      type: _parseOrderType(json['type']),
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category_id': categoryId,
      'type': type.name,
      'image': image,
    };
  }

  static OrderType _parseOrderType(String value) {
    switch (value) {
      case 'dine_in':
        return OrderType.dineIn;
      case 'takeaway':
        return OrderType.takeaway;
      default:
        throw Exception('Unknown order type: $value');
    }
  }
}

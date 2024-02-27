import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {

  final String id;
  final String nameProduct;
  final String stock;
  ProductModel({
    required this.id,
    required this.nameProduct,
    required this.stock,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameProduct': nameProduct,
      'stock': stock,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: (map['id'] ?? '') as String,
      nameProduct: (map['nameProduct'] ?? '') as String,
      stock: (map['stock'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

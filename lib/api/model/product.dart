import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Product {
  final int productKey;
  final String? productType;
  final String? vasCode;
  final String productName;
  final String? productNameDesc;
  final int? productPrice;
  final String? productPriceType;
  final String? subType;
  final String? exappAosUrl;
  final String? exappIosUrl;
  final String? productCatchphrase;
  final String? productComment;
  final String? productBigIcon;
  final String? productSmallIcon;

  Product({
    required this.productKey,
    required this.productType,
    this.vasCode,
    required this.productName,
    required this.productNameDesc,
    this.productPrice,
    this.productPriceType,
    this.subType,
    this.exappAosUrl,
    this.exappIosUrl,
    required this.productCatchphrase,
    required this.productComment,
    required this.productBigIcon,
    required this.productSmallIcon,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

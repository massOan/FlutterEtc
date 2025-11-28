import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'propose_products.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProposeProducts {
  final int proposeKey;
  final String proposeImage;
  final String proposeCategory1;
  final String proposeComment;
  final List<ProposeProduct> proposeProducts;

  ProposeProducts({
    required this.proposeKey,
    required this.proposeImage,
    required this.proposeCategory1,
    required this.proposeComment,
    required this.proposeProducts,
  });

  factory ProposeProducts.fromJson(Map<String, dynamic> json) =>
      _$ProposeProductsFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProposeProduct {
  final String productImage;
  final Product product;

  ProposeProduct({required this.productImage, required this.product});

  factory ProposeProduct.fromJson(Map<String, dynamic> json) =>
      _$ProposeProductFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'lifestyle_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LifestyleDetails {
  final int lifestyleKey;
  final String lifestyleType;
  final String lifestyleTitle;
  final String lifestyleComment;
  final String? lifestyleImage;
  final List<LifestyleDetail> lifestyleDetails;

  LifestyleDetails({
    required this.lifestyleKey,
    required this.lifestyleType,
    required this.lifestyleTitle,
    required this.lifestyleComment,
    required this.lifestyleImage,
    required this.lifestyleDetails,
  });

  factory LifestyleDetails.fromJson(Map<String, dynamic> json) =>
      _$LifestyleDetailsFromJson(json);

  LifestyleDetails copyOf({
    int? lifestyleKey,
    String? lifestyleType,
    String? lifestyleTitle,
    String? lifestyleComment,
    String? lifestyleImage,
    List<LifestyleDetail>? lifestyleDetails,
  }) {
    return LifestyleDetails(
      lifestyleKey: lifestyleKey ?? this.lifestyleKey,
      lifestyleType: lifestyleType ?? this.lifestyleType,
      lifestyleTitle: lifestyleTitle ?? this.lifestyleTitle,
      lifestyleComment: lifestyleComment ?? this.lifestyleComment,
      lifestyleImage: lifestyleImage ?? this.lifestyleImage,
      lifestyleDetails: lifestyleDetails ?? this.lifestyleDetails,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LifestyleDetail {
  int lsDetailKey;
  String lsDetailName;
  String? lsDetailHeadTitle;
  String? lsDetailSubTitle;
  String? lsDetailImage;
  List<Product> products;

  LifestyleDetail({
    required this.lsDetailKey,
    required this.lsDetailName,
    required this.lsDetailHeadTitle,
    required this.lsDetailSubTitle,
    required this.lsDetailImage,
    required this.products,
  });

  factory LifestyleDetail.fromJson(Map<String, dynamic> json) =>
      _$LifestyleDetailFromJson(json);

  LifestyleDetail copyOf({
    int? lsDetailKey,
    String? lsDetailName,
    String? lsDetailHeadTitle,
    String? lsDetailSubTitle,
    String? lsDetailImage,
    List<Product>? products,
  }) {
    return LifestyleDetail(
      lsDetailKey: lsDetailKey ?? this.lsDetailKey,
      lsDetailName: lsDetailName ?? this.lsDetailName,
      lsDetailHeadTitle: lsDetailHeadTitle ?? this.lsDetailHeadTitle,
      lsDetailSubTitle: lsDetailSubTitle ?? this.lsDetailSubTitle,
      lsDetailImage: lsDetailImage ?? this.lsDetailImage,
      products: products ?? this.products,
    );
  }
}

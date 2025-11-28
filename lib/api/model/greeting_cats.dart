import 'package:json_annotation/json_annotation.dart';

part 'greeting_cats.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GreetingCats {
  final List<GreetingCat> greetingCats;

  GreetingCats({required this.greetingCats});

  factory GreetingCats.fromJson(Map<String, dynamic> json) =>
      _$GreetingCatsFromJson(json);

  /// ✅ 더미 데이터 생성
  factory GreetingCats.dummy() {
    return GreetingCats(
      greetingCats: [
        GreetingCat(
          mainCateKey: 1,
          mainCateName: "응원",
          setPromotion: "Y",
          promotionIcon: "https://dummyimage.com/32x32/ff9f00/ffffff",
          promotionPeriod: "2024.01.01 ~ 2024.12.31",
          promotionStart: 1704067200,
          promotionEnd: 1735603200,
          imageUrls: [
            "https://dummyimage.com/600x400/8bc34a/ffffff&text=응원1",
            "https://dummyimage.com/600x400/4caf50/ffffff&text=응원2",
          ],
        ),
        GreetingCat(
          mainCateKey: 2,
          mainCateName: "건강",
          setPromotion: "N",
          promotionIcon: null,
          promotionPeriod: null,
          promotionStart: null,
          promotionEnd: null,
          imageUrls: [
            "https://dummyimage.com/600x400/03a9f4/ffffff&text=건강1",
            "https://dummyimage.com/600x400/0288d1/ffffff&text=건강2",
          ],
        ),
        GreetingCat(
          mainCateKey: 3,
          mainCateName: "행운",
          setPromotion: "N",
          promotionIcon: null,
          promotionPeriod: null,
          promotionStart: null,
          promotionEnd: null,
          imageUrls: [
            "https://dummyimage.com/600x400/ffc107/ffffff&text=행운1",
          ],
        ),
      ],
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GreetingCat {
  final int mainCateKey;
  final String mainCateName;
  final String setPromotion;
  final String? promotionIcon;
  final String? promotionPeriod;
  final int? promotionStart;
  final int? promotionEnd;
  final List<String>? imageUrls;

  GreetingCat({
    required this.mainCateKey,
    required this.mainCateName,
    required this.setPromotion,
    required this.promotionIcon,
    required this.promotionPeriod,
    required this.promotionStart,
    required this.promotionEnd,
    required this.imageUrls,
  });

  factory GreetingCat.fromJson(Map<String, dynamic> json) =>
      _$GreetingCatFromJson(json);
}

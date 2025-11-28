import 'package:json_annotation/json_annotation.dart';

part 'lifestyle_menu.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LifestyleMenu {
  final String homeTitle;
  final String? homeTitleColor;
  final List<Lifestyle> lifestyles;

  LifestyleMenu({
    required this.homeTitle,
    required this.homeTitleColor,
    required this.lifestyles,
  });

  factory LifestyleMenu.fromJson(Map<String, dynamic> json) =>
      _$LifestyleMenuFromJson(json);

  /// 👉 홈 화면용 라이프스타일 더미
  factory LifestyleMenu.dummy() {
    return LifestyleMenu(
      homeTitle: '익준님 생활 패턴에 맞춘 추천',
      homeTitleColor: null, // 색 안 쓰면 null
      lifestyles: [
        Lifestyle.dummy(
          key: 1,
          type: 'DATA',
          title: '데이터 절약 모드 켜기',
          comment: '백그라운드 데이터를 줄여서 요금 부담을 줄여보세요.',
          hashtag: '#데이터절약 #요금관리',
        ),
        Lifestyle.dummy(
          key: 2,
          type: 'BATTERY',
          title: '배터리 최적화',
          comment: '배터리를 많이 쓰는 앱을 확인하고 사용 패턴을 조정해보세요.',
          hashtag: '#배터리관리',
        ),
      ],
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Lifestyle {
  final int lifestyleKey;
  final String lifestyleType;
  final String lifestyleTitle;
  final String lifestyleComment;
  final String? lifestyleHashtag;
  final String lifestyleImage;

  Lifestyle({
    required this.lifestyleKey,
    required this.lifestyleType,
    required this.lifestyleTitle,
    required this.lifestyleComment,
    this.lifestyleHashtag,
    required this.lifestyleImage,
  });

  factory Lifestyle.fromJson(Map<String, dynamic> json) =>
      _$LifestyleFromJson(json);

  /// 👉 라이프스타일 카드 하나짜리 더미
  factory Lifestyle.dummy({
    required int key,
    required String type,
    required String title,
    required String comment,
    String? hashtag,
  }) {
    return Lifestyle(
      lifestyleKey: key,
      lifestyleType: type,
      lifestyleTitle: title,
      lifestyleComment: comment,
      lifestyleHashtag: hashtag,
      // 기본 이미지 하나로 통일 (원하면 다른 이미지로 바꿔도 됨)
      lifestyleImage: 'assets/images/dummy_image.png',
    );
  }
}

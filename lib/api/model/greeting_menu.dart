import 'package:json_annotation/json_annotation.dart';

part 'greeting_menu.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GreetingMenu {
  final String homeTitle;
  final String? homeTitleColor;
  final List<GreetingMenuCat> greetingMenuCats;

  GreetingMenu({
    required this.homeTitle,
    this.homeTitleColor,
    required this.greetingMenuCats,
  });

  factory GreetingMenu.fromJson(Map<String, dynamic> json) =>
      _$GreetingMenuFromJson(json);

  factory GreetingMenu.dummy() {
    return GreetingMenu(
      homeTitle: '익준님, 안녕하세요!',
      // 색 안 쓸 거면 null
      homeTitleColor: null,
      greetingMenuCats: [
        GreetingMenuCat.dummy(
          mainCateKey: 1,
          mainCateName: '추천 서비스',
          midCateKey: 101,
          midCateName: 'AI 요금제 추천',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 2,
          mainCateName: '데이터 관리',
          midCateKey: 201,
          midCateName: '데이터 사용량 보기',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 3,
          mainCateName: '보안 · 안심',
          midCateKey: 301,
          midCateName: '스팸 차단 설정',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 4,
          mainCateName: '통화 관리',
          midCateKey: 401,
          midCateName: '발신/수신 내역 확인',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 5,
          mainCateName: '요금 관리',
          midCateKey: 501,
          midCateName: '이번 달 사용 요약',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 6,
          mainCateName: '가족 관리',
          midCateKey: 601,
          midCateName: '가족 회선 한눈에',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 7,
          mainCateName: '와이파이 · 네트워크',
          midCateKey: 701,
          midCateName: 'Wi-Fi 설정 점검',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 8,
          mainCateName: '저장공간 관리',
          midCateKey: 801,
          midCateName: '불필요한 파일 정리',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 9,
          mainCateName: '배터리 최적화',
          midCateKey: 901,
          midCateName: '배터리 사용 패턴 보기',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 10,
          mainCateName: '앱 권한 관리',
          midCateKey: 1001,
          midCateName: '민감 권한 한 번에',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        // ---- 여기부터 추가 5개 ----
        GreetingMenuCat.dummy(
          mainCateKey: 11,
          mainCateName: '단말 점검',
          midCateKey: 1101,
          midCateName: '휴대폰 상태 체크',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 12,
          mainCateName: '백업 · 복원',
          midCateKey: 1201,
          midCateName: '주소록/사진 백업',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 13,
          mainCateName: '해외 로밍',
          midCateKey: 1301,
          midCateName: '로밍 요금 안내',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 14,
          mainCateName: '멤버십 혜택',
          midCateKey: 1401,
          midCateName: '제휴 할인 모아보기',
          imageUrl: 'assets/images/dummy_image.png',
        ),
        GreetingMenuCat.dummy(
          mainCateKey: 15,
          mainCateName: '공지 · 알림',
          midCateKey: 1501,
          midCateName: '서비스 공지 확인',
          imageUrl: 'assets/images/dummy_image.png',
        ),
      ],
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GreetingMenuCat {
  final int mainCateKey;
  final String mainCateName;
  final String setPromotion;
  final String? promotionIcon;
  final String? promotionPeriod;
  final DateTime? promotionStart;
  final DateTime? promotionEnd;
  final String imageUrl;
  final int midCateKey;
  final String midCateName;

  GreetingMenuCat({
    required this.mainCateKey,
    required this.mainCateName,
    required this.setPromotion,
    required this.promotionIcon,
    required this.promotionPeriod,
    required this.promotionStart,
    required this.promotionEnd,
    required this.imageUrl,
    required this.midCateKey,
    required this.midCateName,
  });

  factory GreetingMenuCat.fromJson(Map<String, dynamic> json) =>
      _$GreetingMenuCatFromJson(json);

  factory GreetingMenuCat.dummy({
    required int mainCateKey,
    required String mainCateName,
    required int midCateKey,
    required String midCateName,
    required String imageUrl,
  }) {
    final now = DateTime.now();
    return GreetingMenuCat(
      mainCateKey: mainCateKey,
      mainCateName: mainCateName,
      setPromotion: 'Y', // 그냥 프로모션 ON으로
      promotionIcon: null,
      promotionPeriod: null,
      promotionStart: now,
      promotionEnd: now.add(const Duration(days: 7)),
      imageUrl: imageUrl,
      midCateKey: midCateKey,
      midCateName: midCateName,
    );
  }
}

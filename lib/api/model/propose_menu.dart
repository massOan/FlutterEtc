import 'package:json_annotation/json_annotation.dart';

part 'propose_menu.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProposeMenu {
  final String homeTitle;
  final String? homeTitleColor;
  final List<ProposeCat> proposeCats;

  ProposeMenu({
    required this.homeTitle,
    required this.homeTitleColor,
    required this.proposeCats,
  });

  factory ProposeMenu.fromJson(Map<String, dynamic> json) =>
      _$ProposeMenuFromJson(json);

  factory ProposeMenu.dummy() {
    return ProposeMenu(
      homeTitle: '익준님께 추천하는 서비스',
      homeTitleColor: null,
      proposeCats: [
        ProposeCat.dummy(
          key: 1,
          category1: '요금제',
          category2: '데이터 많이 쓰는 분',
          comment: '현재 사용량 기준으로 더 저렴한 5G 요금제를 추천드립니다.',
        ),
        ProposeCat.dummy(
          key: 2,
          category1: '부가서비스',
          category2: '보안/안전',
          comment: '스팸 차단과 보안을 강화하는 서비스를 이용해 보세요.',
        ),
        ProposeCat.dummy(
          key: 3,
          category1: '멤버십',
          category2: '할인 혜택',
          comment: '멤버십 등급을 활용하여 영화 및 커피 할인 혜택을 누리세요.',
        ),
        ProposeCat.dummy(
          key: 4,
          category1: '데이터 추가',
          category2: '데이터 부족',
          comment: '월말에 데이터가 부족하시다면 데이터 추가팩을 추천드립니다.',
        ),
        ProposeCat.dummy(
          key: 5,
          category1: '해외 로밍',
          category2: '여행 준비',
          comment: '해외 여행 시 로밍 요금제를 미리 설정해보세요.',
        ),
        ProposeCat.dummy(
          key: 6,
          category1: '기기변경',
          category2: '신형 기기 추천',
          comment: '더 나은 성능의 최신 스마트폰을 추천드립니다.',
        ),
        ProposeCat.dummy(
          key: 7,
          category1: '보험',
          category2: '기기 보호',
          comment: '기기 파손 시 수리 비용을 보장받을 수 있는 보험 상품입니다.',
        ),
        ProposeCat.dummy(
          key: 8,
          category1: '결합상품',
          category2: '가족 결합 할인',
          comment: '가족과 함께 이용 시 통신비를 절약할 수 있습니다.',
        ),
        ProposeCat.dummy(
          key: 9,
          category1: '클라우드',
          category2: '백업/저장',
          comment: '중요한 데이터를 안전하게 보관할 수 있는 클라우드 서비스를 추천드립니다.',
        ),
        ProposeCat.dummy(
          key: 10,
          category1: '음악/영상',
          category2: '콘텐츠 이용자',
          comment: '음악과 영상을 자유롭게 즐길 수 있는 스트리밍 서비스를 확인해보세요.',
        ),
      ],
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProposeCat {
  final int proposeKey;
  final String proposeCategory1;
  final String proposeCategory2;
  final String proposeComment;
  final String proposeImage;
  final String? proposeThumbnailImg;

  ProposeCat({
    required this.proposeKey,
    required this.proposeCategory1,
    required this.proposeCategory2,
    required this.proposeComment,
    required this.proposeImage,
    required this.proposeThumbnailImg,
  });

  factory ProposeCat.fromJson(Map<String, dynamic> json) =>
      _$ProposeCatFromJson(json);

  /// 👉 개별 추천 카드 더미
  factory ProposeCat.dummy({
    required int key,
    required String category1,
    required String category2,
    required String comment,
  }) {
    return ProposeCat(
      proposeKey: key,
      proposeCategory1: category1,
      proposeCategory2: category2,
      proposeComment: comment,
      proposeImage: 'assets/images/dummy_image.png',
      // 썸네일은 일단 사용 안 하니까 null
      proposeThumbnailImg: null,
    );
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'tooltip_banner.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TooltipBanner {
  final int pbannerKey;
  final String pbannerName;
  final String pbannerCommentLine1;
  final String pbannerCommentLine2;
  final String? pbannerImage;
  final int? pbannerSvcKey;
  final String? pbannerAosUrl;
  final String? pbannerIosUrl;

  TooltipBanner({
    required this.pbannerKey,
    required this.pbannerName,
    required this.pbannerCommentLine1,
    required this.pbannerCommentLine2,
    required this.pbannerImage,
    this.pbannerSvcKey,
    this.pbannerAosUrl,
    this.pbannerIosUrl,
  });

  factory TooltipBanner.fromJson(Map<String, dynamic> json) =>
      _$TooltipBannerFromJson(json);

  /// 👇 홈화면에서 쓸 더미 배너들
  factory TooltipBanner.dummy({
    required int key,
    required String name,
    required String line1,
    required String line2,
  }) {
    return TooltipBanner(
      pbannerKey: key,
      pbannerName: name,
      pbannerCommentLine1: line1,
      pbannerCommentLine2: line2,
      // 이미지 기본값 (혹은 null로 두고 싶으면 null로 바꿔도 됨)
      pbannerImage: 'assets/images/dummy_image.png',
      // 필요 없는 값들은 기본값 처리 (null)
      pbannerSvcKey: null,
      pbannerAosUrl: null,
      pbannerIosUrl: null,
    );
  }
}

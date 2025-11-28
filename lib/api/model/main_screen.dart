import 'package:json_annotation/json_annotation.dart';

import 'greeting_menu.dart';
import 'lifestyle_menu.dart';
import 'propose_menu.dart';
import 'tooltip_banner.dart';

part 'main_screen.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MainScreen {
  final List<TooltipBanner> tooltipBanners;
  final GreetingMenu greetingMenu;
  final ProposeMenu proposeMenu;
  final LifestyleMenu lifestyleMenu;

  MainScreen({
    required this.tooltipBanners,
    required this.greetingMenu,
    required this.proposeMenu,
    required this.lifestyleMenu,
  });

  factory MainScreen.dummy() {
    return MainScreen(
      tooltipBanners: [
        TooltipBanner.dummy(
          key: 1,
          name: '오늘의 한마디',
          line1: '오늘은 이루고 싶은 일 목록을',
          line2: '만들어 계획을 세워볼까요?',
        ),
        TooltipBanner.dummy(
          key: 2,
          name: '건강 알림',
          line1: '감기 걸리기 쉬운 날씨예요.',
          line2: '옷은 따뜻하게 챙겨 입으셨나요?',
        ),
        TooltipBanner.dummy(
          key: 3,
          name: '작은 여유',
          line1: '추운 날씨엔 따뜻한 코코아',
          line2: '한 잔의 여유를 즐겨봐요.',
        ),
      ],
      // 👇 이 아래는 네 모델 정의에 맞게만 채우면 됨
      greetingMenu: GreetingMenu.dummy(),
      proposeMenu: ProposeMenu.dummy(),
      lifestyleMenu: LifestyleMenu.dummy(),
    );
  }
}

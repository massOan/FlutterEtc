import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteretc/api/model/main_screen.dart';
import 'package:flutteretc/home/footer/home_screen_footer_widget.dart';
import 'package:flutteretc/home/greeting/home_greeting_widget.dart';
import 'package:flutteretc/home/lifestyle/home_lifestyle_widget.dart';
import 'package:flutteretc/home/mobilereport/home_mobilereport_widget.dart';
import 'package:flutteretc/home/propose/home_propose_widget.dart';
import 'package:flutteretc/home/tooltipbanner/home_details_tooltipbanner_widget.dart';
import '../api/model/main_screen.dart';
import 'health/SmartphoneHealthGridWidget.dart';
import 'menu/HomeMainMenuWidget.dart';

const Color fabColor = Color(0xFF3B4044);
final showFabProvider = StateProvider<bool>((ref) => false);

class AsyncMainScreenNotifier extends AsyncNotifier<MainScreen> {
  @override
  Future<MainScreen> _getData() async {
    await Future.delayed(const Duration(milliseconds: 300)); // 로딩 효과 원하면
    return MainScreen.dummy();
  }

  @override
  Future<MainScreen> build() async {
    return _getData();
  }
}

final asyncMainScreenProvider =
    AsyncNotifierProvider<AsyncMainScreenNotifier, MainScreen>(() {
  return AsyncMainScreenNotifier();
});

class HomeScreen extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMainScreen = ref.watch(asyncMainScreenProvider);
    final scrollController = ref.watch(scrollControllerProvider);

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Demo App"),
            ],
          ),
          actions: [
            Icon(Icons.search),
            IconButton(
              padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
              icon: Icon(Icons.dehaze),
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
        ),
        endDrawer:
            Drawer(backgroundColor: Colors.blue, child: HomeMainMenuWidget()),
        body: asyncMainScreen.when(
          data: (mainScreen) {
            // MainScreen 데이터를 바탕으로 홈 화면 구성
            return Container(
              color: Colors.white,
              child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      HomeDetailsToolTipBannerWidget(
                        textList: [
                          '今日は叶えたいことのリストを作って\n一日の計画を立ててみませんか？',
                          '風邪をひきやすい気温です。\n暖かくしてお出かけくださいね。',
                          '寒い日には、あたたかいココアを飲みながら\nほっと一息つきましょう。',
                        ],
                      ),
                      const SmartphoneHealthGridWidget(),
                      HomeDetailsGreetingWidget(
                          greetingMenu: mainScreen.greetingMenu),
                      HomeDetailsLifeStyleWidget(
                          lifeStyleMenu: mainScreen.lifestyleMenu),
                      HomeDetailsProposeWidget(
                          proposeMenu: mainScreen.proposeMenu),
                      const HomeMobileReportWidget(),
                      FooterWidget(),
                      const ScrollControllerListenerWidget()
                    ],
                  )),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) =>
              Center(child: Text('데이터 로딩에 실패했습니다. ${error}')),
        ),
        floatingActionButton: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final bool showFab = ref.watch(showFabProvider);
          // final scrollController = ref.watch(scrollControllerProvider);
          return HomeFloatiogActionButton(
              scrollController: scrollController, showFab: showFab);
        }));
  }
}

class HomeFloatiogActionButton extends ConsumerWidget {
  final ScrollController scrollController;
  final bool showFab;

  const HomeFloatiogActionButton(
      {Key? key, required this.scrollController, required this.showFab})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final showFab = ref.watch(showFabProvider as ProviderListenable);

    return showFab
        ? FloatingActionButton.small(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => scrollController.jumpTo(0),
            // 최상단으로 스크롤
            child: GestureDetector(
              onTap: () => scrollController.jumpTo(0), // 최상단으로 스크롤
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black),
                width: 40,
                height: 40,
                child: Transform.scale(
                  scale: 1.3,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}

final scrollControllerProvider = Provider<ScrollController>((ref) {
  return ScrollController();
});

class ScrollControllerListenerWidget extends ConsumerStatefulWidget {
  const ScrollControllerListenerWidget({Key? key}) : super(key: key);

  @override
  _ScrollControllerListenerWidgetState createState() =>
      _ScrollControllerListenerWidgetState();
}

class _ScrollControllerListenerWidgetState
    extends ConsumerState<ScrollControllerListenerWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // ScrollController 인스턴스를 가져옵니다.
    _scrollController = ref.read(scrollControllerProvider);
    // 리스너를 추가합니다.
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // 스크롤 위치에 따라 FAB 표시 여부를 결정합니다.
    final bool showFab = _scrollController.position.pixels > 200;
    ref.read(showFabProvider.notifier).state = showFab;
  }

  @override
  void dispose() {
    // 위젯이 dispose될 때 리스너를 제거합니다.
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 이 위젯은 UI에 영향을 주지 않으므로 Container()를 반환합니다.
    return Container();
  }
}
